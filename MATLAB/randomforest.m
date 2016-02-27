B = TreeBagger(4,featureVector(1:400,:),[ones(100,1); 2*ones(100,1); 3*ones(100,1); 4*ones(100,1)]');
[labels,scores]=B.predict(featureVector(401:600,:));
for i=1:200
labels_mat(i)=str2num(labels{i});
end