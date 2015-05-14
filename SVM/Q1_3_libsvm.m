data=[1,0;0,1;0,-1;-1,0;0,2;0,-2;-2,0];
label  = [-1,-1,-1,1,1,1,1]
model = svmtrain(label', data, '-s 0 -t 1 -d 2 -g 1 -r 1 -c 1e+10');
alpha = abs(model.sv_coef)

