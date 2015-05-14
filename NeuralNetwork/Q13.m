data = load('hw4_nnet_train.dat');
X= data(:,1:end-1);
y=data(:,end);
testData = load('hw4_nnet_test.dat');
testX= testData(:,1:end-1);
testY=testData(:,end);

%% parameters of NNet
% eta=[0.001,0.01,0.1,1,10];
eta=[0.01,0.1];
r=0.1;
T=50000;
K=3;



%% parameters of Experiment
nExperiment = length(eta);
tries = 500;
errs = zeros(nExperiment,tries);



%% experiement of NNet
for i =1:nExperiment
    i
    for j =1:tries
        %         disp([num2str(i), '--', num2str(j)])
        NN = BPNNet(X,y,T,K,eta(i),r);
        [predY,err] = pred_BPNNet(NN,testX,testY);
        errs(i,j) = err;
    end
end
mean(errs*100,2)

%  13.0000
%     3.6000
%     3.6560
%    47.6560
%    48.5440

%%
%     3.6000
%     3.8808
