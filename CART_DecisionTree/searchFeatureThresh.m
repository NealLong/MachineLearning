%% Search feature index and ccorresponding threshold value
function [idx, thresh] = searchFeatureThresh(X, lable)
% disp('=======searchFeatureThresh ===========')

featureIdx =size(X,2);
idx =-1;
gini = inf;
thresh = -1;
for i=1:featureIdx
    [curGini, curThresh] = searchThresh(X(:,i), lable);
    if curGini<gini
        gini =curGini;
        thresh = curThresh;
        idx = i;
    end
end
end