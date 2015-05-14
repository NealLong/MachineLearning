A = rand(10000,2);
B=A.^2;
C=A.*B;
mA = mean(A,2);
mB = mean(B,2);
mC=mean(C,2);
cov = mC-mA.*mB;
varA = var(A,1,2);
beta=cov./varA;
mean(beta)
mean(mB-beta.*mA)
mean(mB)
mean(mA)
mean(beta.*mA)

