addpath 'datasets'
load sido0_train
Y = X(:,4932)';
Y(Y==0) = -1;
X = X(:,1:4931)';
X = normc(X);

X_train = X;
Y_train = Y;