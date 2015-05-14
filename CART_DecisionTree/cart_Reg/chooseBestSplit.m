function [ Index, Value ] = chooseBestSplit( dataSet, tolS, tolN )
% 参数中tolS是容许的误差下降值，tolN是切分的最小样本数
    m = size(dataSet);%数据集的大小
    if length(unique(dataSet(:,m(:,2)))) == 1%仅剩下一种时
        Index = 0;
        Value = regLeaf(dataSet(:,m(:,2)));
        return;
    end
    S = regErr(dataSet);%误差
    bestS = inf;%初始化,无穷大
    bestIndex = 0;
    bestValue = 0;
    
    %找到最佳的位置和最优的值
    for j = 1:(m(:,2)-1)%得到列
        b = unique(dataSet(:,j));%得到特征所在的列
        lenCharacter = length(b);
        for i = 1:lenCharacter
            temp = b(i,:);
            [mat0,mat1] = binSplitDataSet(dataSet, j ,temp);
            m0 = size(mat0);
            m1 = size(mat1);
            if m0(:,1) < tolN || m1(:,1) < tolN
                continue;
            end
            newS = regErr(mat0) + regErr(mat1);
            if newS < bestS
                bestS = newS;
                bestIndex = j;
                bestValue = temp;
            end
        end
    end
    
    if (S-bestS) < tolS
        Index = 0;
        Value = regLeaf(dataSet(:,m(:,2)));
        return;
    end
    
    %划分
    [mat0, mat1] = binSplitDataSet(dataSet, bestIndex ,bestValue);
    m0 = size(mat0);
    m1 = size(mat1);
    if m0(:,1) < tolN || m1(:,1) < tolN
        Index = 0;
        Value = regLeaf(dataSet(:,m(:,2)));
        return;
    end
    Index = bestIndex;
    Value = bestValue;
end
