%% �����ݼ�����Ϊ��������
function [ dataSet_1, dataSet_2 ] = binSplitDataSet( dataSet, feature, value )
    [m,n] = size(dataSet);%�������ݼ��Ĵ�С
    DataTemp = dataSet(:,feature)';%�����
    
    %�������б�ǩ�е�Ԫ�ش���value����
    index_1 = [];%�յľ���
    index_2 = [];
    
    for i = 1:m
        if DataTemp(1,i) > value
            index_1 = [index_1,i];
        else
            index_2 = [index_2,i];
        end
    end
    [m_1,n_1] = size(index_1);%����Ҫȡ����
    [m_2,n_2] = size(index_2);
    
    if n_1>0 && n_2>0
        for j = 1:n_1
            dataSet_1(j,:) = dataSet(index_1(1,j),:);
        end
    
        for j = 1:n_2
            dataSet_2(j,:) = dataSet(index_2(1,j),:);
        end
    elseif n_1 == 0
            dataSet_1 = [];
            dataSet_2 = dataSet;
    elseif n_2 == 0
            dataSet_2 = [];
            dataSet_1 = dataSet;
    end
end
%% �����ݼ�����Ϊ��������
function [ dataSet_1, dataSet_2 ] = binSplitDataSet( dataSet, feature, value )
    [m,n] = size(dataSet);%�������ݼ��Ĵ�С
    DataTemp = dataSet(:,feature)';%�����
    
    %�������б�ǩ�е�Ԫ�ش���value����
    index_1 = [];%�յľ���
    index_2 = [];
    
    for i = 1:m
        if DataTemp(1,i) > value
            index_1 = [index_1,i];
        else
            index_2 = [index_2,i];
        end
    end
    [m_1,n_1] = size(index_1);%����Ҫȡ����
    [m_2,n_2] = size(index_2);
    
    if n_1>0 && n_2>0
        for j = 1:n_1
            dataSet_1(j,:) = dataSet(index_1(1,j),:);
        end
    
        for j = 1:n_2
            dataSet_2(j,:) = dataSet(index_2(1,j),:);
        end
    elseif n_1 == 0
            dataSet_1 = [];
            dataSet_2 = dataSet;
    elseif n_2 == 0
            dataSet_2 = [];
            dataSet_1 = dataSet;
    end
end
