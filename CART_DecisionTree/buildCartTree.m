function cartTree = buildCartTree(data,lable,maxHeight)
if nargin<3
    cartTree = newCartTree(data,lable,1,inf);
else
    cartTree = newCartTree(data,lable,1,maxHeight);
end
end


function cartTree = newCartTree(data,lable,curHeight,maxHeight)
if(giniVal(lable)==0 || curHeight>maxHeight)
    cartTree = initTreeNode(true);
    if sum(lable) >= 0
        cartTree.val = 1;
    else
        cartTree.val = -1;
    end
    return
end
cartTree = initTreeNode(false);
[idx, thresh] = searchFeatureThresh(data, lable);
cartTree.idx = idx;
cartTree.thresh = thresh;

%%larger than threshold, then right child, else left child
rIdx = (data(:,idx)>=thresh);
lIdx = ~rIdx;
% 
% disp('=======right===========')
% sum(rIdx)
% disp('=======left===========')
% sum(lIdx)

cartTree.rchild = newCartTree(data(rIdx,:),lable(rIdx,:),curHeight+1,maxHeight);
cartTree.lchild = newCartTree(data(lIdx,:),lable(lIdx,:),curHeight+1,maxHeight);
end












