%% tranverse cart tree and then count number of internel as well as leaf nodes
function [leafCount, internelCount] = countTree(cartTree)
if(~cartTree.isLeaf)
    [lLeafCount, lInternelCount] = countTree(cartTree.lchild);
    [rLeafCount, rInternelCount] = countTree(cartTree.rchild);
    leafCount = lLeafCount+rLeafCount;
    internelCount = 1+ lInternelCount + rInternelCount;
else
    internelCount = 0;
    leafCount =1;
end