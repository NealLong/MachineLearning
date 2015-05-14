%% basic random forrest with CART, during every try random select sampleN samples,
%% totally try T times, every cart tree at most have maxHeight
function rf  =  basicRF(X,lable,T, maxHeight,sampleN)

totalN = size(X,1);
if nargin <4
    maxHeight = inf;
    sampleN = size(X,1);
else if nargin <5      
    sampleN = size(X,1);
end
rf = cell(T, 1);
% parfor i = 1:T
for i = 1:T
    idx = randi(totalN,sampleN,1);
    rf{i} = buildCartTree( X(idx,:),lable(idx,:),maxHeight);
end
end