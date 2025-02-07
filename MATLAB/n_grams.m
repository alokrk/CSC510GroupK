function output = n_grams(inputtext, N)
% returns all the N-grams in inputtext
%
% takes:
%      inputtext: a long string
%      N: N-gram (1 for unigrams)
% output:
%      a cell array of N-grams

terms = regexp(inputtext,'\w*','match');



  nString = numel(terms);
  
  index = repmat((0:(nString-N))',1,N)+repmat(1:N,(nString-N+1),1);
  subStrings = (terms(index));
  
  for i=2:N
      subStrings(:,1) = strcat(subStrings(:,1),repmat({' '}, numel(subStrings(:,1)),1),subStrings(:,i));
  end
  output = subStrings(:,1);
  
end