function [ error ] = regErr( dataSet )
    m = size(dataSet);%求得dataSet的大小
    
    dataVar = var(dataSet(:,m(:,2)));
    
    error = dataVar * (m(:,1)-1);
end
