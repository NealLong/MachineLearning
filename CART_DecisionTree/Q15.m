% data = load('hw3_train.dat');
% X=data(:,1:end-1);
% lable=data(:,end);
% cartTree = buildCartTree(X,lable);
% [leafCount, internelCount] = countTree(cartTree);
tstData = load('hw3_test.dat');
tstX=tstData(:,1:end-1);
tstLable=tstData(:,end);
R = size(tstX,1);
pred_y = zeros(R,1);
for i = 1: R
    pred_y(i) = predCartTree(cartTree,tstX(i,:));
end
error = sum(pred_y~=tstLable)/R
