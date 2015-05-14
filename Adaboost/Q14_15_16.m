disp('==============Q14 Q15 Q16==================')
data = load('hw2_adaboost_train.dat');
X= data(:,1:2);
y=data(:,3);
tempX = sort(X);

diff_temp = diff(tempX);
TH=[-1,-1;tempX(1:end-1,:)+diff_temp/2];
iter =300;
abClassifier = buildAdaBoost(X, TH, y, iter);
abClassifier.sumWeight(1)
%Q14
abClassifier.sumWeight(2)
%Q15
abClassifier.sumWeight(iter)

%Q16
[maxAlpha,indx] = max(abClassifier.Weight);
err = abClassifier.WeakClas{indx}.error
alpha = 0.5*log((1-err)/err)
errTemp= 1/((exp(alpha)^2)+1)

