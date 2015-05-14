% data = load('hw3_train.dat');
% X=data(:,1:end-1);
% lable=data(:,end);
% repeats = 100;
% treeSize = 300;
% rfs = cell(repeats,1);
% tic
% for iter = 1:repeats
%     iter
%     rfs{iter} = basicRF(X,lable,treeSize);
% end
% toc
tic
R = size(X,1);
pred_ys = zeros(R,repeats*treeSize);
rf_predY = zeros(R,repeats);
temp_predY = zeros(treeSize);
for i = 1:R
    i
    cols = 1;
    for iter = 1:repeats
        rf = rfs{iter};
        for j = 1:treeSize
             temp_predY(j) = predCartTree(rf{j},X(i,:));
             pred_ys(i,cols) = temp_predY(j);
             cols = cols+1;
        end
        if sum(temp_predY)>=0
            rf_predY(i,iter) = 1;
        else
            rf_predY(i,iter) = -1;
        end
    end
end


Tree_error = zeros(1,repeats*treeSize);
for i =1:length(Tree_error)
    Tree_error(i) = sum(pred_ys(:,i)~=lable)/R;
end
RF_error =  zeros(1,repeats);
for i =1:length(RF_error)
    RF_error(i) = sum(rf_predY(:,i)~=lable)/R;
end
toc

mean(RF_error)%0

mean(Tree_error)%0.0518