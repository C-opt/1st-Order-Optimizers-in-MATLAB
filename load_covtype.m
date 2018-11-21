addpath 'datasets'
load covtype.data

[X_train,X_test,X_val] = dividerand(covtype', 1.0,0.0,0);

Y_train = X_train(55, :);
X_train = X_train([1:54], :);
X_train = normc(X_train);
Y_train(Y_train ~= 2) = -1;
Y_train(Y_train == 2) = +1;

Y_test = X_test(55, :);
X_test = X_test([1:54], :);
X_test = normc(X_test);
Y_test(Y_test ~= 2) = -1;
Y_test(Y_test == 2) = +1;

clear covtype
clear X_val
clear X_test
clear Y_test