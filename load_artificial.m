addpath ('datasets');
load artificial_data
fprintf('artificial data has been loaded\n');
X_train = normc(X_train);