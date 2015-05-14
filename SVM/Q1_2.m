data=[1,0;0,1;0,-1;-1,0;0,2;0,-2;-2,0];
trans_data  = ones(size(data));
trans_data(:,1) = data(:,2).*data(:,2) - 2*data(:,1)+3;
trans_data(:,2) = data(:,1).*data(:,1) - 2*data(:,2)-3;
