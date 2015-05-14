data = load('hw4_knn_train.dat');
X= data(:,1:end-1);
y=data(:,end);
testData = load('hw4_knn_test.dat');
testX= testData(:,1:end-1);
testY=testData(:,end);
disp('Q15')
[predY,err1] = predKNN(1,X,y,X,y);
err1
disp('Q16')
[predY,err2] = predKNN(1,X,y,testX,testY);
err2

disp('Q17')
[predY,err3] = predKNN(5,X,y,X,y);
err3
disp('Q18')
[predY,err4] = predKNN(5,X,y,testX,testY);
err4




