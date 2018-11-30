load ionosphere
fprintf('ionosphere data has been loaded\n');

X = X';
X = normc(X);
Y = Y';
Y = cell2mat(Y);
Y = double(Y);
Y(Y == 103) = +1;
Y(Y == 98) = -1;

X_train = X;
Y_train = Y;

clear X;
clear Y;