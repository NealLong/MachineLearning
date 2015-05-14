function K = rbfKernel(A, B, gamma)
%GAUSSKERNEL The Gaussian kernel (radial basis function)
%
%   K = GAUSSKERNEL(X, [], sigma);
%   K = GAUSSKERNEL(X, Y, sigma);
%
%       Evaluates the Gaussian kernel in a pairwise manner. 
%       
%       The Gaussian kernel is defined to be
%
%           k(x, y) = exp( -gamma * ||x - y||^2).
%
%       Here, each row of X and Y is a sample of the same dimension. Suppose X has m rows
%       and Y has n rows, then K is a matrix of size m x n.
%
%       If Y is input as empty, it means that X and Y are the same.
%       


if isempty(B)
    sA = sum(A.^2, 2);
    D = bsxfun(@plus, sA, sA')- 2 * (A * A');
else
    sA = sum(A.^2, 2);
    sB = sum(B.^2, 2);
    D =  bsxfun(@plus, sA, sB')- 2 * (A * B');
end

K = exp(-gamma * D ); 

