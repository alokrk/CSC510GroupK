function [preproc_inputcellarray] = preprocessor(inputcellarray)
size_input=size(inputcellarray,2);
preproc_inputcellarray=inputcellarray;
fid = fopen('english.stop');

stopwords = textscan(fid, '%s');
stopwords = stopwords{1,1};
fclose(fid);
doStem=1;
removeStopWords=1;




for i =1:size_input
    %fprintf('%d/%d ', i, size(inputcellarray,1));
    comment = inputcellarray{i};
    comment = SanitizeComment(comment);
    comment = lower(comment);
    comment_sanitised=[];
    r=regexp(comment,' ','split');
    for j =1:size(r,2)
        
        if doStem && numel(cell2mat(r(j)))>5
            word = porterStemmer(cell2mat(r(j)));
        else
             word = (cell2mat(r(j)));
        end
       
        if removeStopWords % if the function caller wants to remove stopwords
            tfflag = isStopWord(word, stopwords);
      
        end
        if(~tfflag)
         comment_sanitised = [comment_sanitised,' ',word];
    end
        
%         if isKey(g, word) && tfflag
%             g(word) = g(word)+1;
%         elseif tfflag && (~strcmp(word,' ')) && (~strcmp(word,''))
%             g(word) = 1;
%         end
        
    end
    
    preproc_inputcellarray{i}=comment_sanitised;
    
    
end
end