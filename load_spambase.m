addpath 'datasets'
load spambase.data

[X_train,X_test,X_val] = dividerand(spambase',1,0,0);


Y_train = X_train(58, :);
X_train = X_train([1:57], :);
X_train = normc(X_train);
Y_train(Y_train == 1) = +1;
Y_train(Y_train == 0) = -1;

Y_test = X_test(58, :);
X_test = X_test([1:57], :);
X_test = normc(X_test);
Y_test(Y_test == 1) = +1;
Y_test(Y_test == 0) = -1;

clear spambase
clear X_val
clear X_test
clear Y_test