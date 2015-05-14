 data = load('hw3_train.dat');
X=data(:,1:end-1);
lable=data(:,end);
repeats = 100;
treeSize = 300;
rfs = cell(repeats,1);
tic
for iter = 1:repeats
    iter
    rfs{iter} = basicRF(X,lable,treeSize,1);
end
toc
tic
R = size(X,1);
inerror = zeros(repeats,1);


for i = 1: repeats
    pred_y = predRF(rfs{i},X);
    inerror(i) = sum(pred_y~=lable)/R;
end
mean(inerror)% 0.1113




tstData = load('hw3_test.dat');
tstX=tstData(:,1:end-1);
tstLable=tstData(:,end);
R = size(tstX,1);
repeats = length(rfs);
error = zeros(repeats,1);
for i = 1: repeats
    i
    pred_y = predRF(rfs{i},tstX);
    error(i) = sum(pred_y~=tstLable)/R;
end
mean(error)%0.1523