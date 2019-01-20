addpath ('altmany-export_fig-412662f');
max_iter = 10^6;

[data_dim, data_size] = size(X_train);

b = floor(sqrt(data_size));
L = 0.25*ones(data_size,1);
m = floor(1.0*data_size/b);
omega = 0.5*(3 + sqrt(9 + 8.0*b/(m+1)));

T = 1;
S_adres = S*T;

[~, ~, w_DASVRDA_sc] = DASVRDA_sc(X_train, Y_train, zeros(data_dim, 1), omega, L, m, b, 200, 10, eta1, lambda1, lambda2, 0, innerPt_no);
[opt_value, ~] = optimizer_APG(X_train, Y_train, w_DASVRDA_sc, lambda1, lambda2, max_iter, 10^(-6));

data_passes_DASVRDA = DASVRDA_dataPass(data_size, m, b, S_adres, T, innerPt_no);
data_passes_SVRG = DASVRDA_dataPass(data_size, 2*data_size, 1, S_adres, 1, innerPt_no);

L_bar = sum(L)*1.0/data_size;
opt_eta = 1.0/((1 + omega*(m+1)/b)*L_bar);

sigma = 0.1;

parfor idx = 1: number_of_experiments
    fprintf('------------------------------EXPERIMENT NO. %d------------------------------\n', idx);                                                                                             
   [time_passes_DASVRDA_adres_sc(:,idx), obj_value_DASVRDA_ns(:,idx), w_DASVRDA_adres_sc] = DASVRDA_ns(X_train, Y_train, mvnrnd(zeros(data_dim, 1), sigma*eye(data_dim),1)', mvnrnd(zeros(data_dim, 1), sigma*eye(data_dim),1)', omega, L, m, b, S, eta1, lambda1, lambda2, 1, innerPt_no);
   [all_S_pflug(:,idx), all_eta(:,idx),time_passes_DASVRDA_adres_sc_pflug(:,idx), obj_value_DASVRDA_pflug_ns(:,idx), w_DASVRDA_adres_sc_pflug] = DASVRDA_pflug_ns(X_train, Y_train, mvnrnd(zeros(data_dim, 1), sigma*eye(data_dim),1)', mvnrnd(zeros(data_dim, 1), sigma*eye(data_dim),1)', omega, L, m, b, S, eta2, lambda1, lambda2, 1, innerPt_no); 
   [~, ~, time_passes_SVRG_adres_sc_pflug(:,idx), obj_value_SVRG_adres_sc_pflug(:,idx), w_SVRG_adres_sc_pflug] = SVRG_adapRestart_pflug_sc(X_train, Y_train, mvnrnd(zeros(data_dim, 1), sigma*eye(data_dim),1)', omega, L, 2*data_size, 1, S_adres, eta3, lambda1, lambda2, innerPt_no);                                                         
   [~, ~, time_passes_SVRG(:,idx), obj_value_SVRG(:,idx), w_SVRG] = SVRG(X_train, Y_train, mvnrnd(zeros(data_dim, 1), sigma*eye(data_dim),1)', omega, L, 2*data_size, 1, S_adres, eta3, lambda1, lambda2, innerPt_no);                                                         
end

xlimit = 300;

figure
p2 = semilogy(data_passes_DASVRDA, mean(obj_value_DASVRDA_ns',1) - opt_value, data_passes_DASVRDA, mean(obj_value_DASVRDA_pflug_ns',1) - opt_value, data_passes_SVRG, mean(obj_value_SVRG_adres_sc_pflug',1) - opt_value, data_passes_SVRG, mean(obj_value_SVRG',1) - opt_value);
p2(1).LineWidth = 1.5;
p2(2).LineWidth = 1.5;
p2(3).LineWidth = 1.5;
p2(4).LineWidth = 1.5;

title(['Experiments']);
xlabel('#(gradients computed)/n');
ylabel('objective gap P(x) - P(x*)');
DASVRDA_ns_legend = ['DASVRDA'];
DASVRDA_pflug_ns_legend = ['Pflug + DASRVDA'];
SVRG_adres_pflug_legend = ['Pflug + SVRG'];
SVRG_legend = ['SVRG'];
ylim([10^(-15) 1])
legend(DASVRDA_ns_legend, DASVRDA_pflug_ns_legend, SVRG_adres_pflug_legend, SVRG_legend);
%saveas(gcf,output_filename)
%set(gcf,'xtick',[],'ytick',[])
%print(gcf, output_filename, '-dpdf')
export_fig(output_filename);

avg_S_pflug = sum(all_S_pflug,2)/number_of_experiments;
avg_eta =  sum(all_eta,2)/number_of_experiments;

data_passes_S_pflug = zeros(S_adres, 1);
for i = 2:S_adres
   data_passes_S_pflug(i) = data_passes_S_pflug(i-1) + (1 + m*b/data_size);
end

subplot(3,1,1);
plot(data_passes_S_pflug, avg_S_pflug)

y1 = -0.5;
line([0,xlimit],[y1,y1])
y2 = 0.5;
line([0,xlimit],[y2,y2])
y3 = 0.5*(y1+y2);
line([0,xlimit],[y3,y3])
xlim([0 xlimit])
title(['Pflug diagnostic behavior'])
xlabel('#(gradients computed)/n');
ylabel('S Pflug value');

subplot(3,1,2);
plot(data_passes_S_pflug, avg_eta)
xlim([0 xlimit])
title(['Pflug diagnostic behavior'])
xlabel('#(gradients computed)/n');
ylabel('Learning rate');

subplot(3,1,3);
p2 = semilogy(data_passes_DASVRDA, mean(obj_value_DASVRDA_pflug_ns',1) - opt_value);
p2(1).LineWidth = 1.5;

title(['Pflug + DASRVDA behavior']);
xlabel('#(gradients computed)/n');
ylabel('objective gap P(x) - P(x*)');
DASVRDA_pflug_ns_legend = ['Pflug + DASRVDA'];
ylim([10^(-15) 1])
xlim([0 xlimit])
legend(DASVRDA_ns_legend, DASVRDA_pflug_ns_legend, SVRG_adres_pflug_legend, SVRG_legend);
%saveas(gcf, output_diagnostic_filename);
%set(gcf,'xtick',[],'ytick',[])
%export_fig fig_SGD.pdf
%print(gcf, output_diagnostic_filename, '-dpdf')
export_fig(output_diagnostic_filename);

