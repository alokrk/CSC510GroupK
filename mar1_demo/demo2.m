clc
clear all
close all
load method2.mat

k=10;
C_android = O_android.posterior(featureVector(2001:4000,:));
C_engg = O_engg.posterior(featureVector(2001:4000,:));
C_android(:,2)=linspace(1,size(C_android,1),size(C_android,1));
% labels= O_android.predict(featureVector(2001:4000,:));
% c=confusionmat([ones(500,1);2*ones(1500,1)],labels);
% trace(c)/sum(sum(c));

C_engg(:,2)=linspace(1,size(C_engg,1),size(C_engg,1));

accum_sort=sortrows(C_android,1);
 accum_sort1=accum_sort(2000-k-20+1:2000-20,:);
test{accum_sort1(:,2)}

% accum_sort=sortrows(C_engg,1);
%  accum_sort1=accum_sort(2000-k-20+1:2000-20,:);
% test{accum_sort1(:,2)};
% 
% labels= O_engg.predict(featureVector(2001:4000,:));
% c=confusionmat([2*ones(500,1);ones(500,1);2*ones(1000,1)],labels);
% trace(c)/sum(sum(c))