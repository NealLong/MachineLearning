data = load('hw2_adaboost_train.dat');
X= data(:,1:2);
y=data(:,3);
tempX = sort(X);

diff_temp = diff(tempX);
TH=[-1,-1;tempX(1:end-1,:)+diff_temp/2];

stump = buildStump(X,TH, y);
stump.error


