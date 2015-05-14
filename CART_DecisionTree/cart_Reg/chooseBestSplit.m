function [ Index, Value ] = chooseBestSplit( dataSet, tolS, tolN )
% ������tolS�����������½�ֵ��tolN���зֵ���С������
    m = size(dataSet);%���ݼ��Ĵ�С
    if length(unique(dataSet(:,m(:,2)))) == 1%��ʣ��һ��ʱ
        Index = 0;
        Value = regLeaf(dataSet(:,m(:,2)));
        return;
    end
    S = regErr(dataSet);%���
    bestS = inf;%��ʼ��,�����
    bestIndex = 0;
    bestValue = 0;
    
    %�ҵ���ѵ�λ�ú����ŵ�ֵ
    for j = 1:(m(:,2)-1)%�õ���
        b = unique(dataSet(:,j));%�õ��������ڵ���
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
    
    %����
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
