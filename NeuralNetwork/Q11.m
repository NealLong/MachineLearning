data = load('hw4_nnet_train.dat');
X= data(:,1:end-1);
y=data(:,end);
testData = load('hw4_nnet_test.dat');
testX= testData(:,1:end-1);
testY=testData(:,end);

%% parameters of NNet
eta=0.1;
r=0.1;
T=50000;
K=[1,6,11,16,21];
%K=[11,16];


%% parameters of Experiment
nExperiment = length(K);
tries = 50;

errs = zeros(nExperiment,tries);
% matlabpool local 4;


%% experiement of NNet
for i =1:nExperiment
    i
    %     parfor j =1:tries
    for j =1:tries
        NN = BPNNet(X,y,T,K(i),eta,r);
        [predY,err] = pred_BPNNet(NN,testX,testY);
        errs(i,j) = err;
    end
end
mean(errs*100,2)


% matlabpool close;
% 
%     29.1600
%     4.2160
%     7.0160
%    10.6720
%    10.8320
