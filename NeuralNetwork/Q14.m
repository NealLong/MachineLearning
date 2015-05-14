data = load('hw4_nnet_train.dat');
X= data(:,1:end-1);
y=data(:,end);
testData = load('hw4_nnet_test.dat');
testX= testData(:,1:end-1);
testY=testData(:,end);

%% parameters of NNet
eta=0.01;
r=0.1;
T=50000;
K1=8;
K2=3;



%% parameters of Experiment
tries = 100;
errs = zeros(tries,1);


%% experiement of NNet

for j =1:tries
    j
    NN = DeepNNet(X,y,T,K1,K2,eta,r);
    [predY,err] = pred_DeepNNet(NN,testX,testY);
    errs(j) = err;
end
avg_errs = mean(errs);

avg_errs
