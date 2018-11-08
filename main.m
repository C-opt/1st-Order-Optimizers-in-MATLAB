clc; clear; close;

%{
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
load ionosphere.mat

X = X';
X = normc(X);
%X = (X - mean(X))./std(X);
Y = Y';
Y = cell2mat(Y);
Y = double(Y);
Y(Y == 103) = +1;
Y(Y == 98) = -1;

X_train = X;
X_test = X;
Y_train = Y;
Y_test = Y;

'Training Data has been loaded'
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
load spambase_1.mat

[spambase_train,spambase_test,spambase_val] = dividerand(spambase',1,0,0);

spambase_train = spambase_train';
spambase_test = spambase_test';

X_train = spambase_train(:, [1:57]);
Y_train = spambase_train(:, 58);
X_train = X_train';
X_train = normc(X_train);
%X_train = (X_train - mean(X_train))./std(X_train);
Y_train(Y_train == 1) = +1;
Y_train(Y_train == 0) = -1;
Y_train = Y_train';

X_test = spambase_test(:, [1:57]);
Y_test = spambase_test(:, 58);
X_test = X_test';
X_test = normc(X_test);
%X_test = (X_test - mean(X_test))./std(X_test);
Y_test(Y_test== 1) = +1;
Y_test(Y_test == 0) = -1;
Y_test= Y_test';
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
load covtype.data

[covtype_train,covtype_test,covtype_val] = dividerand(covtype', 1.0,0.0,0);

X_train = covtype_train([1:54], :);
Y_train = covtype_train(55, :);
%X_train = (X_train - mean(X_train))./std(X_train);
X_train = normc(X_train);
Y_train(Y_train ~= 2) = -1;
Y_train(Y_train == 2) = +1;
Y_train = Y_train;

X_test = covtype_test([1:54], :);
Y_test = covtype_test(55, :);
X_test = (X_test - mean(X_test))./std(X_test);
Y_test(Y_test ~= 2) = -1;
Y_test(Y_test == 2) = +1;
Y_test = Y_test;
'Training Data has been loaded'
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
load images.mat
load labels.mat
labels = labels';
MNIST = [images; labels];
[MNIST_train,MNIST_test,~] = dividerand(MNIST, 0.1,0.9,0);

X_train = MNIST_train([1:784], :);
Y_train = MNIST_train(785, :);
X_train = normc(X_train);
Y_train(Y_train ~= 2) = -1;
Y_train(Y_train == 2) = +1;

'Training Data has been loaded'

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
addpath 'datasets'
load sido0_train
Y = X(:,4932)';
X = X(:,1:4931)';
X = normc(X);
%X = (X - mean(X))./std(X);

X_train = X;
Y_train = Y;

'Training Data has been loaded'
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
load ionosphere.mat

X = X';
X = normc(X);
%X = (X - mean(X))./std(X);
Y = Y';
Y = cell2mat(Y);
Y = double(Y);
Y(Y == 103) = +1;
Y(Y == 98) = -1;

X_train = X;
X_test = X;
Y_train = Y;
Y_test = Y;

'Training Data has been loaded'
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

max_iter = 10^6;
number_of_experiments = 10;

[data_dim, data_size] = size(X_train);
lambda1 = 0;
lambda2 = 10^(-6);
    
b = floor(sqrt(data_size));
L = 0.25*ones(data_size,1);
m = floor(1.0*data_size/b);
omega = 0.5*(3 + sqrt(9 + 8.0*b/(m+1)));

S = 40;
T = 4;
S_adres = S*T;

[~, ~, ~, w_DASVRDA_sc] = DASVRDA_sc(X_train, Y_train, zeros(data_dim, 1), omega, L, m, b, S, T, 5*10^(0), lambda1, lambda2, 0);
[opt_value, w] = optimizer_APG(X_train, Y_train, w_DASVRDA_sc, lambda1, lambda2, max_iter, 10^(-6));

L_bar = sum(L)*1.0/data_size;
opt_eta = 1.0/((1 + omega*(m+1)/b)*L_bar);

parfor idx = 1: number_of_experiments
    fprintf('------------------------------EXPERIMENT NO. %d------------------------------\n', idx);
    [~, time_passes_DASVRDA_sc(:,idx), obj_value_DASVRDA_sc(:,idx), w_DASVRDA_sc] = DASVRDA_sc(X_train, Y_train, zeros(data_dim, 1), omega, L, m, b, S, T, 5*10^(0), lambda1, lambda2, 1);
    [~, time_passes_DASVRDA_adres_sc(:,idx), obj_value_DASVRDA_adres_sc(:,idx), w_DASVRDA_adres_sc] = DASVRDA_adapRestart_sc(X_train, Y_train, zeros(data_dim, 1), omega, L, m, b, S_adres, 4*10^(0), lambda1, lambda2);
    [~, time_passes_DASVRDA_adres_sc_pflug(:,idx), obj_value_DASVRDA_adres_sc_pflug(:,idx), w_DASVRDA_adres_sc_pflug] = DASVRDA_adapRestart_pflug_sc(X_train, Y_train, zeros(data_dim, 1), omega, L, m, b, S_adres, 4.0*10^(0), lambda1, lambda2);
   %[data_passes_DASVRDA_sc_pflug, obj_value_DASVRDA_sc_pflug(:,idx), w_DASVRDA_sc_pflug] = DASVRDA_sc(X_train, Y_train, x_invhat, omega, L, m, b, S, T, lambda1, lambda, 1);
end

figure
p1 = semilogy(mean(time_passes_DASVRDA_sc',1), mean(obj_value_DASVRDA_sc',1) - opt_value, mean(time_passes_DASVRDA_adres_sc',1), mean(obj_value_DASVRDA_adres_sc',1) - opt_value, mean(time_passes_DASVRDA_adres_sc_pflug',1), mean(obj_value_DASVRDA_adres_sc_pflug',1) - opt_value);
p1(1).LineWidth = 2.5;
p1(2).LineWidth = 2.5;
p1(3).LineWidth = 2.5;
%axis([0 1.1 0 1.1]);
title(['Performance of DASVRDA sc']);
xlabel('time in seconds');
ylabel('objective gap P(x) - P(x*)');
DASVRDA_legend = ['DASVRDA sc'];
DASVRDA_adres_legend = ['DASVRDA adap grad restart sc'];
DASVRDA_adres_pflug_legend = ['DASVRDA adap grad restart sc w/ pflug'];
legend(DASVRDA_legend, DASVRDA_adres_legend, DASVRDA_adres_pflug_legend);
saveas(gcf,'./output/database_time_1.jpg')

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% 
% figure
% p2 = semilogy(data_passes_DASVRDA_sc, mean(obj_value_DASVRDA_sc',1) - opt_value, data_passes_DASVRDA_adres_sc, mean(obj_value_DASVRDA_adres_sc',1) - opt_value, data_passes_DASVRDA_adres_sc_pflug, mean(obj_value_DASVRDA_adres_sc_pflug',1) - opt_value);
% p2(1).LineWidth = 2.5;
% p2(2).LineWidth = 2.5;
% p2(3).LineWidth = 2.5;
% %axis([0 730 0 1.1]);
% title(['Performance of DASVRDA sc']);
% xlabel('#(gradients computed)/n');
% ylabel('objective gap P(x) - P(x*)');
% DASVRDA_legend = ['DASVRDA sc'];
% DASVRDA_adres_legend = ['DASVRDA adap grad restart sc'];
% DASVRDA_adres_pflug_legend = ['DASVRDA adap grad restart sc w/ pflug'];
% legend(DASVRDA_legend, DASVRDA_adres_legend, DASVRDA_adres_pflug_legend);
% saveas(gcf,'./output/database_epoch_1.jpg')
% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%