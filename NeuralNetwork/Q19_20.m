data = load('hw4_kmeans_train.dat');
numTry=500;
errs = 0;
for i = 1: numTry
%     i
    [~,err] = kmeans(data,2,500);
    errs = errs+err;
end
err1 = errs/numTry;

disp('Q20')
errs = 0;
for i = 1: numTry
%     i
    [~,err] = kmeans(data,10,500);
    errs = errs+err;
end
err2 =errs/numTry;
err1
err2