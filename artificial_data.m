clc; clear; close;
addpath ('datasets');

data_dim = 100; 
data_num = 5000;

w_opt = zeros(data_dim, 1);

sig = 100;
X_train = mvnrnd(zeros(data_dim,1), sig*eye(data_dim),data_num);
X_train = X_train';
X_train = normc(X_train);

Y_train = zeros(1, data_num);

for i = 1: data_dim
   w_opt(i) = 10*exp(-0.75*i);
end

for i = 1: data_num
   Y_train(i) = sign(X_train(:,i)'*w_opt);
end
% test_accuracy(X_train,Y_train,w_opt)
save artificial_data