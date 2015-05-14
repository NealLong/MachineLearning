disp('==============Q17==================')
data = load('hw2_adaboost_train.dat');
X= data(:,1:2);
y=data(:,3);

testData = load('hw2_adaboost_test.dat');
testX= testData(:,1:2);
testY=testData(:,3);

tempX = sort(X);
diff_temp = diff(tempX);
TH=[-1,-1;tempX(1:end-1,:)+diff_temp/2];
iter =300;


data = load('hw2_adaboost_train.dat');
X= data(:,1:2);
y=data(:,3);
tempX = sort(X);

diff_temp = diff(tempX);
TH=[-1,-1;tempX(1:end-1,:)+diff_temp/2];


%==========Q17=========
%by stump
stump = buildStump(X,TH, y);
pred_y = predStump(testX, stump);
err_label = logical(pred_y ~= testY);
err = sum(err_label)/length(testY)


%by adaboost
abClassifier = buildAdaBoost(X, TH, y, iter,testX,testY);
abClassifier.tstErr(1)

disp('==============Q18==================')

%==========Q18=========
abClassifier.tstErr(300)


[Label, Err] = predAdaBoost(abClassifier, testX, testY);
Err