addpath ('datasets');
addpath('libsvm-3.20/matlab');
[Y_train, X_train] = libsvmread('datasets\a9a');
X_train = X_train';
X_train = normc(X_train);
Y_train = Y_train';