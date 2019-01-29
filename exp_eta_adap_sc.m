addpath ('altmany-export_fig-412662f');
max_iter = 10^6;

[data_dim, data_size] = size(X_train);

b = floor(sqrt(data_size));
L = 0.25*ones(data_size,1);
m = floor(1.0*data_size/b);
omega = 0.5*(3 + sqrt(9 + 8.0*b/(m+1)));

S_adres = S*T;

L_bar = sum(L)*1.0/data_size;
opt_eta = 1.0/((1 + omega*(m + 1)/b)*L_bar);

%sigma = 0.1;
%mvnrnd(zeros(data_dim, 1), sigma*eye(data_dim),1)'
%%
parfor idx = 1: number_of_experiments
    fprintf('------------------------------EXPERIMENT NO. %d------------------------------\n', idx);                           
    [all_S_pflug_over(:,idx), all_eta_over(:,idx), ~, ~, ~] = DASVRDA_adapRestart_pflug_sc(X_train, Y_train, zeros(data_dim, 1), omega, L, m, b, S_adres, eta2, lambda1, lambda2, 0, innerPt_no); 
    [all_S_pflug_under(:,idx), all_eta_under(:,idx), ~, ~, ~] = DASVRDA_adapRestart_pflug_sc(X_train, Y_train, zeros(data_dim, 1), omega, L, m, b, S_adres, eta3, lambda1, lambda2, 0, innerPt_no); 
    %[~, ~, time_passes_SVRG_adres_sc_pflug(:,idx), obj_value_SVRG_adres_sc_pflug(:,idx), w_SVRG_adres_sc_pflug] = SVRG_adapRestart_pflug_sc(X_train, Y_train, zeros(data_dim, 1), omega, L, 2*data_size, 1, S_adres, eta4, lambda1, lambda2, innerPt_no);                                                                                   
end

%%
xlimit = 450;

avg_S_pflug_over = sum(all_S_pflug_over,2)/number_of_experiments;
avg_eta_over =  sum(all_eta_over,2)/number_of_experiments;

data_passes_S_pflug = zeros(S_adres, 1);
for i = 2:S_adres
   data_passes_S_pflug(i) = data_passes_S_pflug(i-1) + (1 + m*b/data_size);
end

subplot(2,1,1);
plot_S_pflug = plot(data_passes_S_pflug, avg_S_pflug_over, 'r');
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
title(['Pflug + DASVRDA']);
xlabel('#Gradients Computed / n');
ylabel('S Pflug');

subplot(2,1,2);
plot_avg_eta = semilogy(data_passes_S_pflug, avg_eta_over, 'r');
plot_avg_eta.LineWidth = 1.3;
xlim([0 xlimit])
ylim([eta3*10^(-1) eta2*10^(1)])
p4 = line([0,xlimit],[eta1,eta1]);
p4.LineWidth = 1.3;
xlabel('#Gradients Computed / n');
ylabel('Learning Rate');

set(gcf, 'color', 'w');
export_fig(output_filename_over);

%%
avg_S_pflug_under = sum(all_S_pflug_under,2)/number_of_experiments;
avg_eta_under =  sum(all_eta_under,2)/number_of_experiments;

subplot(2,1,1);
plot_S_pflug = plot(data_passes_S_pflug, avg_S_pflug_under, 'r');
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
title(['Pflug + DASVRDA']);
xlabel('#Gradients Computed / n');
ylabel('S Pflug');

subplot(2,1,2);
plot_avg_eta = semilogy(data_passes_S_pflug, avg_eta_under,'r');
plot_avg_eta.LineWidth = 1.3;
xlim([0 xlimit])
ylim([10^(-4) 10^(4)])
p4 = line([0,xlimit],[eta1,eta1]);
p4.LineWidth = 1.3;
xlabel('#Gradients Computed / n');
ylabel('Learning Rate');

set(gcf, 'color', 'w');
export_fig(output_filename_under);