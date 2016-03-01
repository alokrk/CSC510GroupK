% B_android = TreeBagger(20,featureVector(1:2000,:),[ones(500,1); 2*ones(1500,1);]');
% labels= B_android.predict(featureVector(2001:4000,:));
% for i=1:2000
% labels_mat(i)=str2num(labels{i});
% end
%  c=confusionmat([ones(500,1); 2*ones(1500,1)],labels_mat);
% trace(c)/sum(sum(c))

clc
clear all
close all

load method3.mat
k=10;
[~,scores] = B.predict(featureVector(2001:4000,:));
scores(:,2)=linspace(1,size(scores,1),size(scores,1));

accum_sort=sortrows(scores,1);
 accum_sort1=accum_sort(2000-k:2000,:);
test{accum_sort1(:,2)}
