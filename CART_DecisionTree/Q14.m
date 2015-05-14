% data = load('hw3_train.dat');
% X=data(:,1:end-1);
% lable=data(:,end);
% cartTree = buildCartTree(X,lable);
% [leafCount, internelCount] = countTree(cartTree);
R = size(X,1);
pred_y = zeros(R,1);
for i = 1: R
    pred_y(i) = predCartTree(cartTree,X(i,:));
end
error = sum(pred_y~=lable)/R
