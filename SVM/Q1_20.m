origin_data=load('features.train.txt');
thresh = [1 10 100 1000 10000];
len = length(thresh);
r_count=zeros(1,len);
Eouts = 1:len;
for test  = 1:10
    disp('==========================================');
    disp(test);
    data = origin_data(randperm(size(origin_data,1)),:);
    inputLabel = data(1:1000,1);
    testLabel = data(1:1000,1);
    testLabel(inputLabel ==0)=1;
    testLabel(inputLabel ~=0)=-1;
    testFeature = data(1:1000,2:end);
    
    test_data = data(1001:end,:);;
    inputLabel = test_data(:,1);
    label = test_data(:,1);
    label(inputLabel ==0)=1;
    label(inputLabel ~=0)=-1;
    feature = test_data(:,2:end);
    
    for i = 1:length(thresh)
        T = thresh(i);
        %     fprintf('Test %d \n',T);
        %         disp('==========================================')
        options = sprintf('-s 0 -t 2  -g %e  -c 0.1 -q', T);
        %train
        model = svmtrain(label, feature, options);
        %test
        [predict_label, accuracy, dec_values] = svmpredict(testLabel, testFeature, model);
        
        
        % Eout
        Eouts(i) = 100- accuracy(1);
        
    end
    [val,ind] = min(Eouts);
    r_count(ind) = r_count(ind)+1;
end
