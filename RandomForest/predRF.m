function pred_y  =  predRF(rf, X)
T = length(rf);
y = zeros(1,T);
R= size(X,1);
pred_y = zeros(R,1);
% parfor i=1:T
for r = 1: R
    for i=1:T
        y(i) = predCartTree(rf{i},X(r,:));
    end
    
    if sum(y)>=0
        pred_y(r) =1;
    else
        pred_y(r) = -1;
    end
end
end



