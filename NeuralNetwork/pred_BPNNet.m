function [predY, err] =  pred_BPNNet(NNet,X,Y)
W1= NNet{1};
W2=NNet{2};
rows= size(X,1);
appendCol = ones(rows,1);
X0 = [appendCol, X];
X1 = [appendCol, tanh(X0*W1)];
predY= X1*W2;
ind = (predY>=0);
predY(ind) =1;
predY(~ind) =-1;
if nargin>2
    err = sum(predY~=Y)/rows;
end
end

