clc; clear; close;

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
load spambase_1.mat

[spambase_train,spambase_test,spambase_val] = dividerand(spambase', 0.01,0.99,0);

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

max_iter = 10^6;
number_of_experiments = 10;

[data_dim, data_size] = size(X_train);
lambda1 = 0;
lambda2 = 10^(-6);

[opt_value, ~] = simple_full_gradient(X_train, Y_train, lambda1, lambda2, max_iter, 10^(-11));

b = ceil(sqrt(data_size));
L = 0.25*ones(data_size,1);
m = ceil(1.0*data_size/b);
omega = 0.5*(3 + sqrt(9 + 8.0*b/(m+1)));

S = 10;
T = 50;
S_adres = S*T;

for idx = 1: number_of_experiments
    fprintf('------------------------------EXPERIMENT NO. %d------------------------------\n', idx);
    [data_passes_DASVRDA_sc, ~, obj_value_DASVRDA_sc_1(:,idx), ~] = DASVRDA_adres_sc(X_train, Y_train, zeros(data_dim, 1), omega, L, m, b, S_adres, 1*10^(-2), lambda1, lambda2, 0);
    [~, ~, obj_value_DASVRDA_sc_2(:,idx), ~] = DASVRDA_adres_sc(X_train, Y_train, zeros(data_dim, 1), omega, L, m, b, S_adres, 2*10^(-2), lambda1, lambda2, 0);
    [~, ~, obj_value_DASVRDA_sc_3(:,idx), ~] = DASVRDA_adres_sc(X_train, Y_train, zeros(data_dim, 1), omega, L, m, b, S_adres, 5*10^(-2), lambda1, lambda2, 0);
    
    [~, ~, obj_value_DASVRDA_sc_4(:,idx), ~] = DASVRDA_adres_sc(X_train, Y_train, zeros(data_dim, 1), omega, L, m, b, S_adres, 1*10^(-1), lambda1, lambda2, 0);
    [~, ~, obj_value_DASVRDA_sc_5(:,idx), ~] = DASVRDA_adres_sc(X_train, Y_train, zeros(data_dim, 1), omega, L, m, b, S_adres, 2*10^(-1), lambda1, lambda2, 0);
    [~, ~, obj_value_DASVRDA_sc_6(:,idx), ~] = DASVRDA_adres_sc(X_train, Y_train, zeros(data_dim, 1), omega, L, m, b, S_adres, 5*10^(-1), lambda1, lambda2, 0);
    
    [~, ~, obj_value_DASVRDA_sc_7(:,idx), ~] = DASVRDA_adres_sc(X_train, Y_train, zeros(data_dim, 1), omega, L, m, b, S_adres, 1*10^(0), lambda1, lambda2, 0);
    [~, ~, obj_value_DASVRDA_sc_8(:,idx), ~] = DASVRDA_adres_sc(X_train, Y_train, zeros(data_dim, 1), omega, L, m, b, S_adres, 2*10^(0), lambda1, lambda2, 0);
    [~, ~, obj_value_DASVRDA_sc_9(:,idx), ~] = DASVRDA_adres_sc(X_train, Y_train, zeros(data_dim, 1), omega, L, m, b, S_adres, 5*10^(0), lambda1, lambda2, 0);
    
    [~, ~, obj_value_DASVRDA_sc_10(:,idx), ~] = DASVRDA_adres_sc(X_train, Y_train, zeros(data_dim, 1), omega, L, m, b, S_adres, 1*10^(1), lambda1, lambda2, 0);
    [~, ~, obj_value_DASVRDA_sc_11(:,idx), ~] = DASVRDA_adres_sc(X_train, Y_train, zeros(data_dim, 1), omega, L, m, b, S_adres, 2*10^(1), lambda1, lambda2, 0);
    [~, ~, obj_value_DASVRDA_sc_12(:,idx), ~] = DASVRDA_adres_sc(X_train, Y_train, zeros(data_dim, 1), omega, L, m, b, S_adres, 5*10^(1), lambda1, lambda2, 0);
    
    [~, ~, obj_value_DASVRDA_sc_13(:,idx), ~] = DASVRDA_adres_sc(X_train, Y_train, zeros(data_dim, 1), omega, L, m, b, S_adres, 1*10^(2), lambda1, lambda2, 0);
    [~, ~, obj_value_DASVRDA_sc_14(:,idx), ~] = DASVRDA_adres_sc(X_train, Y_train, zeros(data_dim, 1), omega, L, m, b, S_adres, 2*10^(2), lambda1, lambda2, 0);
    [~, ~, obj_value_DASVRDA_sc_15(:,idx), ~] = DASVRDA_adres_sc(X_train, Y_train, zeros(data_dim, 1), omega, L, m, b, S_adres, 5*10^(2), lambda1, lambda2, 0);
end

figure
gr1 = semilogy(mean(data_passes_DASVRDA_sc',1), mean(obj_value_DASVRDA_sc_1',1) - opt_value); hold on;
gr2 = semilogy(mean(data_passes_DASVRDA_sc',1), mean(obj_value_DASVRDA_sc_2',1) - opt_value); hold on;
gr3 = semilogy(mean(data_passes_DASVRDA_sc',1), mean(obj_value_DASVRDA_sc_3',1) - opt_value); hold on;
gr4 = semilogy(mean(data_passes_DASVRDA_sc',1), mean(obj_value_DASVRDA_sc_4',1) - opt_value);  hold on;
gr5 = semilogy(mean(data_passes_DASVRDA_sc',1), mean(obj_value_DASVRDA_sc_5',1) - opt_value); hold on;
gr6 = semilogy(mean(data_passes_DASVRDA_sc',1), mean(obj_value_DASVRDA_sc_6',1) - opt_value); hold on;
gr7 = semilogy(mean(data_passes_DASVRDA_sc',1), mean(obj_value_DASVRDA_sc_7',1) - opt_value); hold on;
gr8 = semilogy(mean(data_passes_DASVRDA_sc',1), mean(obj_value_DASVRDA_sc_8',1) - opt_value); hold on;
gr9 = semilogy(mean(data_passes_DASVRDA_sc',1), mean(obj_value_DASVRDA_sc_9',1) - opt_value); hold on;
gr10 = semilogy(mean(data_passes_DASVRDA_sc',1), mean(obj_value_DASVRDA_sc_10',1) - opt_value); hold on; 
gr11 = semilogy(mean(data_passes_DASVRDA_sc',1), mean(obj_value_DASVRDA_sc_11',1) - opt_value); hold on;
gr12 = semilogy(mean(data_passes_DASVRDA_sc',1), mean(obj_value_DASVRDA_sc_12',1) - opt_value); hold on;
gr13 = semilogy(mean(data_passes_DASVRDA_sc',1), mean(obj_value_DASVRDA_sc_13',1) - opt_value); hold on;
gr14 = semilogy(mean(data_passes_DASVRDA_sc',1), mean(obj_value_DASVRDA_sc_14',1) - opt_value); hold on;
gr15 = semilogy(mean(data_passes_DASVRDA_sc',1), mean(obj_value_DASVRDA_sc_15',1) - opt_value); hold on;

set(gr1(1), 'linewidth', 2.5);
set(gr2(1), 'linewidth', 2.5);
set(gr3(1), 'linewidth', 2.5);
set(gr4(1), 'linewidth', 1.0);
set(gr5(1), 'linewidth', 2.5);
set(gr6(1), 'linewidth', 2.5);
set(gr7(1), 'linewidth', 2.5);
set(gr8(1), 'linewidth', 2.5);
set(gr9(1), 'linewidth', 2.5);
set(gr10(1), 'linewidth', 10.0);
set(gr11(1), 'linewidth', 2.5);
set(gr12(1), 'linewidth', 2.5);
set(gr13(1), 'linewidth', 2.5);
set(gr14(1), 'linewidth', 2.5);
set(gr15(1), 'linewidth', 2.5);

hold on
%axis([0 1.1 0 1.1]);
title(['Performance of DASVRDA sc']);
xlabel('time in seconds');
ylabel('objective gap P(x) - P(x*)');
DASVRDA_legend_1 = ['DASVRDA sc 1'];
DASVRDA_legend_2 = ['DASVRDA sc 2'];
DASVRDA_legend_3 = ['DASVRDA sc 3'];
DASVRDA_legend_4 = ['DASVRDA sc 4'];
DASVRDA_legend_5 = ['DASVRDA sc 5'];
DASVRDA_legend_6 = ['DASVRDA sc 6'];
DASVRDA_legend_7 = ['DASVRDA sc 7'];
DASVRDA_legend_8 = ['DASVRDA sc 8'];
DASVRDA_legend_9 = ['DASVRDA sc 9'];
DASVRDA_legend_10 = ['DASVRDA sc 10'];
DASVRDA_legend_11 = ['DASVRDA sc 11'];
DASVRDA_legend_12 = ['DASVRDA sc 12'];
DASVRDA_legend_13 = ['DASVRDA sc 13'];
DASVRDA_legend_14 = ['DASVRDA sc 14'];
DASVRDA_legend_15 = ['DASVRDA sc 15'];

legend(DASVRDA_legend_1, DASVRDA_legend_2, DASVRDA_legend_3, DASVRDA_legend_4, DASVRDA_legend_5, DASVRDA_legend_6, DASVRDA_legend_7, DASVRDA_legend_8, DASVRDA_legend_9, DASVRDA_legend_10, DASVRDA_legend_11, DASVRDA_legend_12, DASVRDA_legend_13, DASVRDA_legend_14, DASVRDA_legend_15);

hold off