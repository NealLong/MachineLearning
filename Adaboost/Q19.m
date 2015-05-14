disp('==============Q19==================')
data = load('hw2_lssvm_all.dat');
% data = [ones(size(data,1),1) data];
trnData = data(1:400,1:end-1);
trnY = data(1:400,end);
tstData = data(401:end,1:end-1);
tstY = data(401:end,end);
gammas = [32,2,0.125];
lambdas =[0.001,1,1000];
runs = length(lambdas)*length(gammas)
errIns = zeros(1,runs)
errOuts = zeros(1,runs)
runs=1

for(i=1:length(gammas))
    gamma = gammas(i)
    for(j=1:length(lambdas))
        lambda = lambdas(j)
        %% Build RBF Kernel
        K =  rbfKernel(trnData, [], gamma);
        
        
        %% Calculating betta
  %      betta = (K + lambda*eye(size(K)))\trnY;
       betta = inv(K + lambda*eye(size(K)))*trnY;
        %% Calculating the final answer
        pred_trnY = betta'*rbfKernel(trnData, trnData, gamma);
        errIns(runs) = sum((trnY'.*pred_trnY)<0);
        
        
        pred_tstY = betta'*rbfKernel(trnData, tstData, gamma);
        errOuts(runs) = sum((tstY'.*pred_tstY)<0);
        runs=runs+1
    end;
end
min(errIns/size(trnData,1))
min(errOuts/size(tstData,1))