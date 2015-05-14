data = load('hw3_train.dat');
X=data(:,1:end-1);
lable=data(:,end);
cartTree = buildCartTree(X,lable);
[leafCount, internelCount] = countTree(cartTree)