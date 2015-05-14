data=load('features.train.txt');
inputLabel = data(:,1);
label = data(:,1);

thresh = 0:2:8;
len = length(thresh)
acc = 1:len
for i = 1:length(thresh)
    T = thresh(i);
    fprintf('Test %d \n',T);
    label(inputLabel ==T)=1;
    label(inputLabel ~=T)=-1;
    feature = data(:,2:end);
    model = svmtrain(label, feature, '-s 0 -t 1 -d 2 -g 1 -r 1 -c 0.01 -q');
    [predict_label, accuracy, dec_values] = svmpredict(label, feature, model);
    acc(i) = accuracy(1);
end


