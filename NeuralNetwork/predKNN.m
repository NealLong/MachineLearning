function [predY,err] = predKNN(k,trnX, trnY, tstX,tstY)
sA = sum(trnX.^2, 2);
sB = sum(tstX.^2, 2);
dist = bsxfun(@plus, sA, sB')- 2 * (trnX * tstX');
len = size(tstX,1);
predY = ones(len,1);
for j = 1:len
    [sortDist,inds] = sort(dist(:,j));
    sortY = trnY(inds);
    votes = 0;
    for i = 1:k
        votes = votes+sortY(i);
    end
    if(votes<0)
        predY(j) = -1;
    end
end
if(nargin>4)
    err = sum(predY~=tstY)/len;
end



