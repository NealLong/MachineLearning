function [ error ] = regErr( dataSet )
    m = size(dataSet);%���dataSet�Ĵ�С
    
    dataVar = var(dataSet(:,m(:,2)));
    
    error = dataVar * (m(:,1)-1);
end
