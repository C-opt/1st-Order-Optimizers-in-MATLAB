addpath 'datasets'
load images
load labels
labels = labels';
MNIST = [images; labels];
[MNIST_train,MNIST_test,~] = dividerand(MNIST, 0.1,0.9,0);

X_train = MNIST_train([1:784], :);
Y_train = MNIST_train(785, :);
X_train = normc(X_train);
X_train = X_train';
Y_train = Y_train';
Y_train(Y_train ~= 2) = -1;
Y_train(Y_train == 2) = +1;

clear images
clear labels
clear MNIST
clear MNIST_test
clear MNIST_train