hinduism=xml2struct('Posts_h.xml');
japanese=xml2struct('Posts_j.xml');
mat=xml2struct('Posts_mat.xml');
budd=xml2struct('Posts_b.xml');
ss=[];for i=1:size(budd.posts.row,2)
ss{i}=budd.posts.row{i}.Attributes.Body;
end
all=[];for j=1:100
all{end+1}=ss{j};
end
ss=[];for i=1:size(hinduism.posts.row,2)
ss{i}=hinduism.posts.row{i}.Attributes.Body;
end
for j=1:100
all{end+1}=ss{j};
end
ss=[];for i=1:size(japanese.posts.row,2)
ss{i}=japanese.posts.row{i}.Attributes.Body;
end
for j=1:100
all{end+1}=ss{j};
end
ss=[];for i=1:size(mat.posts.row,2)
ss{i}=mat.posts.row{i}.Attributes.Body;
end
for j=1:100
all{end+1}=ss{j};
end
train=all;
test=[];
ss=[];for i=101:150
ss{i-100}=budd.posts.row{i}.Attributes.Body;
end
for j=1:50
test{end+1}=ss{j};
end
ss=[];for i=101:150
ss{i-100}=hinduism.posts.row{i}.Attributes.Body;
end
for j=1:50
test{end+1}=ss{j};
end
ss=[];for i=101:150
ss{i-100}=japanese.posts.row{i}.Attributes.Body;
end
for j=1:50
test{end+1}=ss{j};
end
ss=[];for i=101:150
ss{i-100}=mat.posts.row{i}.Attributes.Body;
end
for j=1:50
test{end+1}=ss{j};
end
all=[train test];
featureVector = featurize(all', n, 1, 1);
O1 = NaiveBayes.fit(featureVector(1:400,:),[ones(100,1); 2*ones(100,1); 3*ones(100,1); 4*ones(100,1)]','dist','mn');
C2 = O1.posterior(featureVector(401:600,:));