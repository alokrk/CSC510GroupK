s=xml2struct('posts-trial.xml');
k=3;%make this input param for how many posts to recommend
ss=[];
for i=1:size(s.posts.row,2)
ss{i}=s.posts.row{i}.Attributes.Body;
end
clear s;
preproc_inputcellarray = preprocessor(ss);
clear ss;
ngrams_preprocessed=[];
for i=1:size(preproc_inputcellarray,2)
ngrams_preprocessed=[ngrams_preprocessed;[n_grams(preproc_inputcellarray{i},3) num2cell(repmat(i,size(n_grams(preproc_inputcellarray{i},3))))]];
end
% 
% for i=1:size(sentence1,2)
% ngrams_preprocessed_ten=[ngrams_preprocessed_ten;[n_grams(sentence1{i},3) num2cell(repmat(i,size(n_grams(sentence1{i},3))))]];
% end

%assume meaningless user preferences
userinput = input('Enter three or more keywords to search for relevant posts within single quotes');
up=userinput;

%up='motorola junk junk';
upn=n_grams(up,3);

accum=[];
for i=1:size(upn,1)
for j=1:size(ngrams_preprocessed,1)
[v,~]=EditDistance(char(upn{i}),char(ngrams_preprocessed{j,1}));accum(end+1,:)=[v,j];
end
end

accum_sort=sortrows(accum,1);
accum_sort1=accum_sort(1:k,:);
preproc_inputcellarray{cell2mat(ngrams_preprocessed(accum_sort1(:,2),2))}