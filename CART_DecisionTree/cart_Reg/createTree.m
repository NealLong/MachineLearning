function [ retTree ] = createTree( dataSet,tolS,tolN )
    [feat,val] = chooseBestSplit(dataSet, tolS, tolN);
    
    disp(['feat:', num2str(feat)]);
    disp(['value:', num2str(val)]);
    if feat == 0
        return;
    end
    
    [lSet,rSet] = binSplitDataSet(dataSet, feat, val);
    disp('left:');
    createTree( lSet,tolS,tolN );
    disp('right:');
    createTree( rSet,tolS,tolN );
end
