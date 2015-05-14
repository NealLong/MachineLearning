data = load('hw4_nnet_train.dat');
X= data(:,1:end-1);
y=data(:,end);
testData = load('hw4_nnet_test.dat');
testX= testData(:,1:end-1);
testY=testData(:,end);

%% parameters of NNet
eta=0.1;
%r=[0,0.001,0.1,10,1000];
 r=[0.001,0.1];
T=50000;
K=3;



%% parameters of Experiment
nExperiment = length(r);
tries = 500;
errs = zeros(nExperiment,tries);



%% experiement of NNet
for i =1:nExperiment
    i
    %     parfor j =1:tries
    for j =1:tries
        %         disp([num2str(i), '--', num2str(j)])
        NN = BPNNet(X,y,T,K,eta,r(i));
        [predY,err] = pred_BPNNet(NN,testX,testY);
        errs(i,j) = err;
    end
end
mean(errs*100,2)

%    49.2160
%     3.6800
%     3.8000
%    33.0640
%    51.4560

%%专门跑0.01和0.01 500次
%    3.7552
%    3.7424
