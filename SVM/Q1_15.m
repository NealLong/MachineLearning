data=load('features.train.txt');
inputLabel = data(:,1);
label = data(:,1);
label(inputLabel ==0)=1;
label(inputLabel ~=0)=-1;
feature = data(:,2:end);
model = svmtrain(label, feature, '-t 0 -c 0.01');
coef = model.sv_coef;
SVs = model.SVs;
w= coef'*full(SVs)
norm(w,2)

