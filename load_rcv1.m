addpath ('datasets');
addpath('libsvm-3.20/matlab');
[Y_train,X_train] = libsvmread('datasets\rcv1_train.binary');
fprintf('rcv1 data has been loaded\n');
X_train = X_train';
X_train = normc(X_train);
Y_train = Y_train';