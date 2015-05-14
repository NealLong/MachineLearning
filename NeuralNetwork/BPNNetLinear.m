%% BPNNetLinear(X,Y,T,K,eta,r)
%
% 2 layer d-K-1 neural network with back propagation with tanh-type neurons
% except for the output layer, which is just linear function
% X is the N*d data, y is N*1 lable
% eta is learning rate of gradient decent, and [-r,r] is the range of
% randomly initialzing weight
% K neurons in 1st layer, and conduct T iterations
function NN = BPNNetLinear(X,Y,T,K,eta,r)
[rows,cols] = size(X);

%%initialize weight
W1=2*r*rand(cols+1,K)- r ;
W2=2*r*rand(K+1,1)- r ;

%% iterate T times
for t = 1:T
    %% select example
    ind = randi(rows);
    x0 = [1 X(ind,:)]';
    y = Y(ind);
    
    %% forward propgate to compute X(l)
    s1 = W1'*x0;
    x1 = [1;tanh(s1)];
    s2 = W2'*x1;
    
    %% backward propagate
    delta1 = -2*(y-s2);
    delta2 = (1-tanh(s1).^2).*W2(2:end)*delta1;
    
    
    %% chech gradient delta1
%             Delta1 = x1*delta1;
%             epsilon = 0.0001;
%             inx = 3;
%             W2Plus = W2;
%             W2Minus = W2;
%             W2Plus(inx) =W2Plus(inx)+epsilon;
%             W2Minus(inx) = W2Minus(inx)-epsilon;
%             approxDelta1 = ((y-W2Plus'*x1)^2 - (y-W2Minus'*x1)^2) /(2*epsilon);
%             assert(abs(approxDelta1- Delta1(inx))<1e-5)
    %
    %
    %% chech gradient delta2
%             Delta2 = x0*delta2';
%             epsilon = 0.0001;
%             idx1 = 2;
%             idx2 = 5;
%             W1Plus = W1;
%             W1Minus = W1;
%             W1Plus(idx1,idx2) =W1Plus(idx1,idx2)+epsilon;
%             W1Minus(idx1,idx2) = W1Minus(idx1,idx2)-epsilon;
%             approxDelta2 = ((y-W2'*[1;tanh(W1Plus'*x0)])^2 - (y-W2'*[1;tanh(W1Minus'*x0)])^2) /(2*epsilon);
%             assert(abs(approxDelta2- Delta2(idx1,idx2))<1e-5)
    
    %% update W1 W2
    W1 = W1-eta*x0*delta2';
    W2 = W2-eta*x1*delta1;
end
NN=cell(2);
NN{1}= W1;
NN{2} = W2;

end
