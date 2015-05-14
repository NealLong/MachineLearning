tstData = load('hw3_test.dat');
tstX=tstData(:,1:end-1);
tstLable=tstData(:,end);
R = size(tstX,1);
pred_y = zeros(R,1);
repeats = length(rfs);
tstError = zeros(repeats,1);
for i = 1: repeats
    i
    pred_y = predRF(rfs{i},tstX);
    tstError(i) = sum(pred_y~=tstLable)/R;
end
mean(tstError)