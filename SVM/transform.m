function out_matrix = transform( x )
%TRANSFORM Summary of this function goes here
%   Detailed explanation goes here
out_matrix = ones(size(x,1),1)
out_matrix = [out_matrix sqrt(2)*x x(:,1).*x(:,2) x(:,2).*x(:,1) x.^2]
end

