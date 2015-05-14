data=load('features.train.txt');
inputLabel = data(:,1);
label = data(:,1);
label(inputLabel ==0)=1;
label(inputLabel ~=0)=-1;
feature = data(:,2:end);

test_data=load('features.test.txt');
inputLabel = test_data(:,1);
testLabel = test_data(:,1);
testLabel(inputLabel ==0)=1;
testLabel(inputLabel ~=0)=-1;
testFeature = test_data(:,2:end);

thresh = [1 10 100 1000 10000];
len = length(thresh);

Eouts = 1:len;

for i = 1:length(thresh)
    T = thresh(i);
%     fprintf('Test %d \n',T);
    disp('==========================================')
    options = sprintf('-s 0 -t 2  -g %e  -c 0.1', T)
    %train
    model = svmtrain(label, feature, options);
    %test
    [predict_label, accuracy, dec_values] = svmpredict(testLabel, testFeature, model);
    
  
    % Eout
    Eouts(i) = 100- accuracy(1);
    
end


