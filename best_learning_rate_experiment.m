clc; clear; close;

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

addpath 'datasets'
load sido0_train
Y = X(:,4932)';
Y(Y==0) = -1;
X = X(:,1:4931)';
X = normc(X);
%X = (X - mean(X))./std(X);

X_train = X;
Y_train = Y;

'Training Data has been loaded'
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

max_iter = 10^6;
number_of_experiments = 40;

[data_dim, data_size] = size(X_train);
lambda1 = 10^(-4);
lambda2 = 0;z

b = ceil(sqrt(data_size));
L = 0.25*ones(data_size,1);
m = ceil(1.0*data_size/b);
omega = 0.5*(3 + sqrt(9 + 8.0*b/(m+1)));

S = 40;
T = 4;
S_adres = S*T;

detail_lvl = 0.10;

[~, ~, ~, w_DASVRDA_sc] = DASVRDA_sc(X_train, Y_train, zeros(data_dim, 1), omega, L, m, b, 40, 10, 5*10^(0), lambda1, lambda2, 0, detail_lvl);
[opt_value, w] = optimizer_APG(X_train, Y_train, w_DASVRDA_sc, lambda1, lambda2, max_iter, 10^(-6));

parfor idx = 1: number_of_experiments
    fprintf('------------------------------EXPERIMENT NO. %d------------------------------\n', idx);
                                                                    %DASVRDA_sc(X_train, Y_train, zeros(data_dim, 1), omega, L, m, b, S, T, 5*10^(0), lambda1, lambda2, 1, 0.15);
    [~, time_passes_DASVRDA_sc_1(:,idx), obj_value_DASVRDA_sc_1(:,idx), ~] = DASVRDA_ns(X_train, Y_train, zeros(data_dim, 1), zeros(data_dim, 1), omega, L, m, b, S, 1*10^(-2), lambda1, lambda2, 1, detail_lvl);
    [~, time_passes_DASVRDA_sc_2(:,idx), obj_value_DASVRDA_sc_2(:,idx), ~] = DASVRDA_ns(X_train, Y_train, zeros(data_dim, 1), zeros(data_dim, 1), omega, L, m, b, S, 2*10^(-2), lambda1, lambda2, 1, detail_lvl);
    [~, time_passes_DASVRDA_sc_3(:,idx), obj_value_DASVRDA_sc_3(:,idx), ~] = DASVRDA_ns(X_train, Y_train, zeros(data_dim, 1), zeros(data_dim, 1), omega, L, m, b, S, 5*10^(-2), lambda1, lambda2, 1, detail_lvl);
    
    [~, time_passes_DASVRDA_sc_4(:,idx), obj_value_DASVRDA_sc_4(:,idx), ~] = DASVRDA_ns(X_train, Y_train, zeros(data_dim, 1), zeros(data_dim, 1), omega, L, m, b, S, 1*10^(-1), lambda1, lambda2, 1, detail_lvl);
    [~, time_passes_DASVRDA_sc_5(:,idx), obj_value_DASVRDA_sc_5(:,idx), ~] = DASVRDA_ns(X_train, Y_train, zeros(data_dim, 1), zeros(data_dim, 1), omega, L, m, b, S, 2*10^(-1), lambda1, lambda2, 1, detail_lvl);
    [~, time_passes_DASVRDA_sc_6(:,idx), obj_value_DASVRDA_sc_6(:,idx), ~] = DASVRDA_ns(X_train, Y_train, zeros(data_dim, 1), zeros(data_dim, 1), omega, L, m, b, S, 5*10^(-1), lambda1, lambda2, 1, detail_lvl);
    
    [~, time_passes_DASVRDA_sc_7(:,idx), obj_value_DASVRDA_sc_7(:,idx), ~] = DASVRDA_ns(X_train, Y_train, zeros(data_dim, 1), zeros(data_dim, 1), omega, L, m, b, S, 1*10^(0), lambda1, lambda2, 1, detail_lvl);
    [~, time_passes_DASVRDA_sc_8(:,idx), obj_value_DASVRDA_sc_8(:,idx), ~] = DASVRDA_ns(X_train, Y_train, zeros(data_dim, 1), zeros(data_dim, 1), omega, L, m, b, S, 2*10^(0), lambda1, lambda2, 1, detail_lvl);
    [~, time_passes_DASVRDA_sc_9(:,idx), obj_value_DASVRDA_sc_9(:,idx), ~] = DASVRDA_ns(X_train, Y_train, zeros(data_dim, 1), zeros(data_dim, 1), omega, L, m, b, S, 5*10^(0), lambda1, lambda2, 0, detail_lvl);
    
    [~, time_passes_DASVRDA_sc_10(:,idx), obj_value_DASVRDA_sc_10(:,idx), ~] = DASVRDA_ns(X_train, Y_train, zeros(data_dim, 1), zeros(data_dim, 1), omega, L, m, b, S, 1*10^(1), lambda1, lambda2, 1, detail_lvl);
    [~, time_passes_DASVRDA_sc_11(:,idx), obj_value_DASVRDA_sc_11(:,idx), ~] = DASVRDA_ns(X_train, Y_train, zeros(data_dim, 1), zeros(data_dim, 1), omega, L, m, b, S, 2*10^(1), lambda1, lambda2, 1, detail_lvl);
    [~, time_passes_DASVRDA_sc_12(:,idx), obj_value_DASVRDA_sc_12(:,idx), ~] = DASVRDA_ns(X_train, Y_train, zeros(data_dim, 1), zeros(data_dim, 1), omega, L, m, b, S, 5*10^(1), lambda1, lambda2, 1, detail_lvl);
    
    [~, time_passes_DASVRDA_sc_13(:,idx), obj_value_DASVRDA_sc_13(:,idx), ~] = DASVRDA_ns(X_train, Y_train, zeros(data_dim, 1), zeros(data_dim, 1), omega, L, m, b, S, 1*10^(2), lambda1, lambda2, 1, detail_lvl);
    [~, time_passes_DASVRDA_sc_14(:,idx), obj_value_DASVRDA_sc_14(:,idx), ~] = DASVRDA_ns(X_train, Y_train, zeros(data_dim, 1), zeros(data_dim, 1), omega, L, m, b, S, 2*10^(2), lambda1, lambda2, 1, detail_lvl);
    [~, time_passes_DASVRDA_sc_15(:,idx), obj_value_DASVRDA_sc_15(:,idx), ~] = DASVRDA_ns(X_train, Y_train, zeros(data_dim, 1), zeros(data_dim, 1), omega, L, m, b, S, 5*10^(2), lambda1, lambda2, 1, detail_lvl);
end

figure
gr1 = semilogy(mean(time_passes_DASVRDA_sc_1',1), mean(obj_value_DASVRDA_sc_1',1) - opt_value); hold on;
gr2 = semilogy(mean(time_passes_DASVRDA_sc_2',1), mean(obj_value_DASVRDA_sc_2',1) - opt_value); hold on;
gr3 = semilogy(mean(time_passes_DASVRDA_sc_3',1), mean(obj_value_DASVRDA_sc_3',1) - opt_value); hold on;
gr4 = semilogy(mean(time_passes_DASVRDA_sc_4',1), mean(obj_value_DASVRDA_sc_4',1) - opt_value);  hold on;
gr5 = semilogy(mean(time_passes_DASVRDA_sc_5',1), mean(obj_value_DASVRDA_sc_5',1) - opt_value); hold on;
gr6 = semilogy(mean(time_passes_DASVRDA_sc_6',1), mean(obj_value_DASVRDA_sc_6',1) - opt_value); hold on;
gr7 = semilogy(mean(time_passes_DASVRDA_sc_7',1), mean(obj_value_DASVRDA_sc_7',1) - opt_value); hold on;
gr8 = semilogy(mean(time_passes_DASVRDA_sc_8',1), mean(obj_value_DASVRDA_sc_8',1) - opt_value); hold on;
gr9 = semilogy(mean(time_passes_DASVRDA_sc_9',1), mean(obj_value_DASVRDA_sc_9',1) - opt_value); hold on;
gr10 = semilogy(mean(time_passes_DASVRDA_sc_10',1), mean(obj_value_DASVRDA_sc_10',1) - opt_value); hold on; 
gr11 = semilogy(mean(time_passes_DASVRDA_sc_11',1), mean(obj_value_DASVRDA_sc_11',1) - opt_value); hold on;
gr12 = semilogy(mean(time_passes_DASVRDA_sc_12',1), mean(obj_value_DASVRDA_sc_12',1) - opt_value); hold on;
gr13 = semilogy(mean(time_passes_DASVRDA_sc_13',1), mean(obj_value_DASVRDA_sc_13',1) - opt_value); hold on;
gr14 = semilogy(mean(time_passes_DASVRDA_sc_14',1), mean(obj_value_DASVRDA_sc_14',1) - opt_value); hold on;
gr15 = semilogy(mean(time_passes_DASVRDA_sc_15',1), mean(obj_value_DASVRDA_sc_15',1) - opt_value); hold on;

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