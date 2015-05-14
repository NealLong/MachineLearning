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



thresh = [0.001,0.01,0.1,1,10];
len = length(thresh);
totalSVs = 1:len;
Eouts = 1:len;
errSum1 = 1:len;
errSum2 = 1:len;
errSum3 = 1:len;
for i = 1:length(thresh)
    T = thresh(i);
%     fprintf('Test %d \n',T);
    disp('==========================================')
    options = sprintf('-s 0 -t 2  -g 100  -c %e ', T)
    %train
    model = svmtrain(label, feature, options);
    %test
    [predict_label, accuracy, dec_values] = svmpredict(testLabel, testFeature, model);
    
    % #SV  
    totalSV(i) = model.totalSV;
    
    % Eout
    Eouts(i) = 100- accuracy(1);
    
%     
    sv_label = label(model.sv_indices);
    sv_feature = feature(model.sv_indices,:);
%     
%     
%     %dec_val = w_sv*sv_feature+b WRONG!!!!!
%     w= model.sv_coef'*full(model.SVs);
%     b = -model.rho;   
%     errSum1(i) = sum(max(1- (sv_feature*w'+b).*sv_label,0));
%     
    %dec_val = sum(sv_coef(i)*K(sv(i),Z))+b 
    sv_coef = model.sv_coef';
    errSum2(i) = sum(max(1-(sv_coef*rbfKernel(sv_feature,[],100)+b).*sv_label',0));
%     
%     %dec_val = predict sv
%     [predict_label, accuracy, dec_values] = svmpredict(sv_label, sv_feature, model);
%     errSum3(i) = sum(max(1-dec_values.*sv_label,0));
end
