addpath ('altmany-export_fig-412662f');
max_iter = 10^6;

[data_dim, data_size] = size(X_train);

b = floor(sqrt(data_size));
L = 0.25*ones(data_size,1);
m = floor(1.0*data_size/b);
omega = 0.5*(3 + sqrt(9 + 8.0*b/(m+1)));

S_adres = S*T;

[~, ~, w_DASVRDA_sc] = DASVRDA_sc(X_train, Y_train, zeros(data_dim, 1), omega, L, m, b, S, T, eta1, lambda1, lambda2, 0, innerPt_no);
[opt_value, ~] = optimizer_APG(X_train, Y_train, w_DASVRDA_sc, lambda1, lambda2, max_iter, 10^(-6));

data_passes_DASVRDA_sc = DASVRDA_dataPass(data_size, m, b, S, T, innerPt_no);
data_passes_DASVRDA = DASVRDA_dataPass(data_size, m, b, S_adres, 1, innerPt_no);
data_passes_SVRG = DASVRDA_dataPass(data_size, 2.0*data_size/b, b, S_adres, 1, innerPt_no);

L_bar = sum(L)*1.0/data_size;
opt_eta = 1.0/((1 + omega*(m + 1)/b)*L_bar);

%sigma = 0.1;
%mvnrnd(zeros(data_dim, 1), sigma*eye(data_dim),1)'
%%
parfor idx = 1: number_of_experiments
    fprintf('------------------------------EXPERIMENT NO. %d------------------------------\n', idx);
    [~, ~, time_passes_SVRG(:,idx), obj_value_SVRG(:,idx), w_SVRG] = SVRG(X_train, Y_train, zeros(data_dim, 1), omega, L, 2.0*data_size/b, b, S_adres, eta4, lambda1, lambda2, innerPt_no);                              
    [time_passes_DASVRDA_sc(:,idx), obj_value_DASVRDA_sc(:,idx), w_DASVRDA_sc] = DASVRDA_sc(X_train, Y_train, zeros(data_dim, 1), omega, L, m, b, S, T, eta1, lambda1, lambda2, 1, innerPt_no);
    [time_passes_DASVRDA_adres_sc(:,idx), obj_value_DASVRDA_adres_sc(:,idx), w_DASVRDA_adres_sc] = DASVRDA_adapRestart_sc(X_train, Y_train, zeros(data_dim, 1), omega, L, m, b, S_adres, eta2, lambda1, lambda2, innerPt_no);
    [all_S_pflug(:,idx), all_eta(:,idx), time_passes_DASVRDA_adres_sc_pflug(:,idx), obj_value_DASVRDA_adres_sc_pflug(:,idx), w_DASVRDA_adres_sc_pflug] = DASVRDA_adapRestart_pflug_sc(X_train, Y_train, zeros(data_dim, 1), omega, L, m, b, S_adres, eta3, lambda1, lambda2, 1, innerPt_no); 
    %[~, ~, time_passes_SVRG_adres_sc_pflug(:,idx), obj_value_SVRG_adres_sc_pflug(:,idx), w_SVRG_adres_sc_pflug] = SVRG_adapRestart_pflug_sc(X_train, Y_train, zeros(data_dim, 1), omega, L, 2*data_size, 1, S_adres, eta4, lambda1, lambda2, innerPt_no);                                                                                   
end

%%
xlimit = 200;

figure

% tmp = mean(obj_value_SVRG',1) - opt_value;
% pretty_plot_obj_SVRG = semilogy(data_passes_SVRG(boolean_SVRG), tmp(boolean_SVRG), 'bs'); hold on;
% pretty_plot_obj_SVRG.LineWidth = 2.0;
% 
% tmp = mean(obj_value_DASVRDA_sc',1) - opt_value;
% pretty_plot_obj_perRes_DASVRDA = semilogy(data_passes_DASVRDA_sc(boolean_DASVRDA_sc), tmp(boolean_DASVRDA_sc), 'ro'); hold on;
% pretty_plot_obj_perRes_DASVRDA.LineWidth = 2.0;
% 
% tmp = mean(obj_value_DASVRDA_adres_sc',1) - opt_value;
% pretty_plot_obj_adapRes_DASVRDA = semilogy(data_passes_DASVRDA(boolean_DASVRDA), tmp(boolean_DASVRDA), 'kp'); hold on;
% pretty_plot_obj_adapRes_DASVRDA.LineWidth = 2.0;
% 
% tmp = mean(obj_value_DASVRDA_adres_sc_pflug',1) - opt_value;
% pretty_plot_obj_pflug_adapRes_DASVRDA = semilogy(data_passes_DASVRDA(boolean_DASVRDA), tmp(boolean_DASVRDA), 'mh'); hold on;
% pretty_plot_obj_pflug_adapRes_DASVRDA.LineWidth = 2.0;

plot_obj_SVRG = semilogy(data_passes_SVRG, mean(obj_value_SVRG',1) - opt_value, '-s'); hold on;
plot_obj_SVRG.MarkerIndices = floor(20:size(data_passes_SVRG,1)/10:size(data_passes_SVRG,1));

plot_obj_perRes_DASVRDA = semilogy(data_passes_DASVRDA_sc, mean(obj_value_DASVRDA_sc',1) - opt_value, '-o'); hold on;
plot_obj_perRes_DASVRDA.MarkerIndices = floor(20:size(data_passes_DASVRDA_sc,1)/10:size(data_passes_DASVRDA_sc,1));

plot_obj_adapRes_DASVRDA = semilogy(data_passes_DASVRDA, mean(obj_value_DASVRDA_adres_sc',1) - opt_value, '-p'); hold on;
tmp = floor(20:size(data_passes_DASVRDA,1)/10:size(data_passes_DASVRDA,1));
plot_obj_adapRes_DASVRDA.MarkerIndices = tmp;

plot_obj_pflug_adapRes_DASVRDA = semilogy(data_passes_DASVRDA, mean(obj_value_DASVRDA_adres_sc_pflug',1) - opt_value, '-h'); hold on;
plot_obj_pflug_adapRes_DASVRDA.MarkerIndices = 0.5*(-tmp(1)+tmp(2)) + tmp;

plot_obj_SVRG.LineWidth = 1.5;
plot_obj_perRes_DASVRDA.LineWidth = 1.5;
plot_obj_adapRes_DASVRDA.LineWidth = 1.5;
plot_obj_pflug_adapRes_DASVRDA.LineWidth = 1.5;

xlabel('#Gradients Computed / n');
ylabel('Objective Gap');
DASVRDA_legend = ['PerRes DASVRDA'];
DASVRDA_adres_legend = ['AdapRes DASVRDA'];
DASVRDA_adres_pflug_legend = ['Pflug + AdapRes DASRVDA'];
SVRG_legend = ['SVRG'];
ylim([10^(-15) 1])
xlim([0 xlimit])
legend(SVRG_legend, DASVRDA_legend, DASVRDA_adres_legend, DASVRDA_adres_pflug_legend);
set(gcf, 'color', 'w');
export_fig(output_filename);
%%
avg_S_pflug = sum(all_S_pflug,2)/number_of_experiments;
avg_eta =  sum(all_eta,2)/number_of_experiments;

data_passes_S_pflug = zeros(S_adres, 1);
for i = 2:S_adres
   data_passes_S_pflug(i) = data_passes_S_pflug(i-1) + (1 + m*b/data_size);
end

subplot(2,1,1);
plot_S_pflug = plot(data_passes_S_pflug, avg_S_pflug, 'r');
plot_S_pflug.LineWidth = 1.5;

y1 = -0.0;
p1 = line([0,xlimit],[y1,y1]);
p1.LineWidth = 1.3;

y2 = 0.9;
p2 = line([0,xlimit],[y2,y2]);
p2.LineWidth = 1.3;

y3 = 0.5*(y1+y2);
p3 = line([0,xlimit],[y3,y3]);
p3.LineWidth = 2.0;
%p3.ColorSpec = [0.5 0.5 0.5];

xlim([0 xlimit])
ylim([-1 1])
title(['Pflug + DASVRDA behavior']);
xlabel('#Gradients Computed / n');
ylabel('S Pflug');

subplot(2,1,2);
plot_avg_eta = plot(data_passes_S_pflug, avg_eta, 'r');
plot_avg_eta.LineWidth = 1.3;
xlim([0 xlimit])
xlabel('#Gradients Computed / n');
ylabel('Learning Rate');

% subplot(3,1,3);
% p2 = semilogy(data_passes_DASVRDA, mean(obj_value_DASVRDA_adres_sc_pflug',1) - opt_value);
% p2(1).LineWidth = 1.5;
% 
% xlabel('#Gradients Computed / n');
% ylabel('Objective Gap');

set(gcf, 'color', 'w');
export_fig(output_diagnostic_filename);
