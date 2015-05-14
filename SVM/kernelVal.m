function K = kernelVal(X,X2)
    K = (X * X2' + 1)^2;
end