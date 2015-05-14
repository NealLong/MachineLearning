A=rand(4,3)
B=rand(5,3)
K1 = ones(size(A,1),size(B,1));
for i = 1:size(A,1)
    for j = 1:size(B,1)
        K1(i,j) = exp(-1*sum((A(i,:)-B(j,:)).^2));
    end
end
K2 = rbfKernel(A,B,1);
assert(all(all(abs(K1-K2)<1e-12)))