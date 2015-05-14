function y  =  predCartTree(cartTree, x)
while ~cartTree.isLeaf
   if x(cartTree.idx)>=cartTree.thresh
       cartTree = cartTree.rchild;
   else
       cartTree = cartTree.lchild;
   end
end
y = cartTree.val;
