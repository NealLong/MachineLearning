K = ones(size(A,1),size(B,1));
for i = 1:size(A,1)
    for j = 1:size(B,1)
        K(i,j) = exp(-1*sum((A(i,:)-B(j,:)).^2));
    end
end
K
        