function [lable,err] = kmeans(X,k,T)
rows = size(X,1);
lable = zeros(rows,1);

%% initialize centers
rndIdx = randperm(rows);
centers = X(rndIdx(1:k),:);
sA = sum(X.^2, 2);

for i=1:T
    %% assign to centers
    sB = sum(centers.^2, 2);
    dist = bsxfun(@plus, sA, sB')- 2 * (X * centers');
 
    
    [val,idx] = min(dist,[],2);
    lable = idx;
    
    %% update new centers
    for j=1:k
        centers(j,:) = mean(X(lable==j,:),1);
    end
    
    
end
sB = sum(centers.^2, 2);
dist = bsxfun(@plus, sA, sB')- 2 * (X * centers');
val = min(dist,[],2);

err = sum(val)/rows;


end