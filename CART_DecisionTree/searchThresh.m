%% Search  threshold value of a given feature vector
function [gini, thresh] = searchThresh(x, lable)
% disp('=======searchThresh ===========')
x_val=sort(x);
diff_x = diff(x_val);
% size(x_val(1:end-1)+diff_x/2)
cadidates=[-10;x_val(1:end-1)+diff_x/2;10];
gini = inf;
thresh = -1;
for i =1:length(cadidates)
    curThresh = cadidates(i);
%     disp('=======thresh ===========')
%     curThresh
    rLables = lable(x>=curThresh);
    lLables = lable(x<curThresh);
%     disp('=======================')
%     disp('=======thresh ===========')
%     curThresh
%     disp('=======right eval ===========')
%     length(rLables)
%     disp('=======left eval ===========')
%     length(lLables)
    curGini = length(rLables)*giniVal(rLables) + length(lLables)*giniVal(lLables);
%     disp('=======gini ===========')
%     curGini
    
    if curGini<gini
        gini = curGini;
        thresh = curThresh;
    end
end
end
