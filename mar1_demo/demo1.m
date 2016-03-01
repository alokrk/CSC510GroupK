clc
clear all
close all
k=10;
%clear ss;
% ngrams_preprocessed=[];
% for i=1:size(preproc_inputcellarray,2)
% ngrams_preprocessed=[ngrams_preprocessed;[n_grams(preproc_inputcellarray{i},3) num2cell(repmat(i,size(n_grams(preproc_inputcellarray{i},3))))]];
% end
load method1.mat;

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
all{cell2mat(ngrams_preprocessed(accum_sort1(:,2),2))}