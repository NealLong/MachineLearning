data=[1,0;0,1;0,-1;-1,0;0,2;0,-2;-2,0];
label  = [-1,-1,-1,1,1,1,1]
N = size(data,1);
Q = ones(N)
for i = 1 : N 
    for j = 1: N 
        Q(i,j) = label(i)*label(j)*kernelVal(data(i,:),data(j,:));
    end
end

H =Q;
f=-1*ones(N,1);
Aeq = label;
Beq = 0;
lb = zeros(N,1);

opts = optimset('Algorithm', 'interior-point-convex','Display','off');

[alpha,fval,exitflag,output,lambda] = quadprog(H,f,[],[],Aeq,Beq, lb,[],[],opts);

trans_data = transform(data)
y = label.*alpha';

w = y*trans_data

b = label(2)-w*trans_data(2,:)'


