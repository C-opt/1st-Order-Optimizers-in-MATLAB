max_iter = 10^6;

[data_dim, data_size] = size(X_train);

b = floor(sqrt(data_size));
L = 0.25*ones(data_size,1);
m = floor(1.0*data_size/b);
omega = 0.5*(3 + sqrt(9 + 8.0*b/(m+1)));

S = 75;
T = 4;
S_adres = S*T;

[~, ~, w_DASVRDA_sc] = DASVRDA_sc(X_train, Y_train, zeros(data_dim, 1), omega, L, m, b, S, 10, eta1, lambda1, lambda2, 0, innerPt_no);
[opt_value, ~] = optimizer_APG(X_train, Y_train, w_DASVRDA_sc, lambda1, lambda2, max_iter, 10^(-4));

data_passes_DASVRDA_sc = DASVRDA_dataPass(data_size, m, b, S, T, innerPt_no);
data_passes_DASVRDA = DASVRDA_dataPass(data_size, m, b, S_adres, 1, innerPt_no);
data_passes_SVRG = DASVRDA_dataPass(data_size, 2*data_size, 1, S_adres, 1, innerPt_no);

L_bar = sum(L)*1.0/data_size;
opt_eta = 1.0/((1 + omega*(m + 1)/b)*L_bar);

parfor idx = 1: number_of_experiments
    fprintf('------------------------------EXPERIMENT NO. %d------------------------------\n', idx);
    [time_passes_DASVRDA_sc(:,idx), obj_value_DASVRDA_sc(:,idx), w_DASVRDA_sc] = DASVRDA_sc(X_train, Y_train, zeros(data_dim, 1), omega, L, m, b, S, T, eta1, lambda1, lambda2, 1, innerPt_no);
    [time_passes_DASVRDA_adres_sc(:,idx), obj_value_DASVRDA_adres_sc(:,idx), w_DASVRDA_adres_sc] = DASVRDA_adapRestart_sc(X_train, Y_train, zeros(data_dim, 1), omega, L, m, b, S_adres, eta2, lambda1, lambda2, innerPt_no);
    [all_S_pflug(:,idx), all_eta(:,idx), time_passes_DASVRDA_adres_sc_pflug(:,idx), obj_value_DASVRDA_adres_sc_pflug(:,idx), w_DASVRDA_adres_sc_pflug] = DASVRDA_adapRestart_pflug_sc(X_train, Y_train, zeros(data_dim, 1), omega, L, m, b, S_adres, eta3, lambda1, lambda2, innerPt_no); 
    [~, ~, time_passes_SVRG_adres_sc_pflug(:,idx), obj_value_SVRG_adres_sc_pflug(:,idx), w_SVRG_adres_sc_pflug] = SVRG_adapRestart_pflug_sc(X_train, Y_train, zeros(data_dim, 1), omega, L, 2*data_size, 1, S_adres, eta4, lambda1, lambda2, innerPt_no);                                                         
    [~, ~, time_passes_SVRG(:,idx), obj_value_SVRG(:,idx), w_SVRG] = SVRG(X_train, Y_train, zeros(data_dim, 1), omega, L, 2*data_size, 1, S_adres, eta4, lambda1, lambda2, innerPt_no);                                                         
end

figure
p2 = semilogy(data_passes_DASVRDA_sc, mean(obj_value_DASVRDA_sc',1) - opt_value, data_passes_DASVRDA, mean(obj_value_DASVRDA_adres_sc',1) - opt_value, data_passes_DASVRDA, mean(obj_value_DASVRDA_adres_sc_pflug',1) - opt_value, data_passes_SVRG, mean(obj_value_SVRG_adres_sc_pflug',1) - opt_value, data_passes_SVRG, mean(obj_value_SVRG',1) - opt_value);
p2(1).LineWidth = 1.5;
p2(2).LineWidth = 1.5;
p2(3).LineWidth = 1.5;
p2(4).LineWidth = 1.5;
p2(5).LineWidth = 1.5;

title(['Experiments']);
xlabel('#(gradients computed)/n');
ylabel('objective gap P(x) - P(x*)');
DASVRDA_legend = ['Periodic Restart DASVRDA'];
DASVRDA_adres_legend = ['Adaptative Restart DASVRDA'];
DASVRDA_adres_pflug_legend = ['Pflug + DASRVDA'];
SVRG_adres_pflug_legend = ['Pflug + SVRG'];
SVRG_legend = ['SVRG'];
ylim([10^(-15) 1])
legend(DASVRDA_legend, DASVRDA_adres_legend, DASVRDA_adres_pflug_legend, SVRG_adres_pflug_legend, SVRG_legend);
saveas(gcf, output_filename)

% avg_S_pflug = sum(all_S_pflug,2)/number_of_experiments;
% avg_eta =  sum(all_eta,2)/number_of_experiments;
% 
% subplot(2,1,1);
% plot(avg_S_pflug)
% 
% y1 = 0.1;
% line([0,200],[y1,y1])
% y2 = 0.6;
% line([0,200],[y2,y2])
% 
% xlim([0 200])
% title(['Pflug diagnostic behavior'])
% xlabel('#times Pflug has changed learning rate');
% ylabel('S Pflug value');
% 
% subplot(2,1,2);
% plot(avg_eta)
% xlim([0 200])
% title(['Pflug diagnostic behavior'])
% xlabel('#times Pflug has changed learning rate');
% ylabel('Learning rate');
% saveas(gcf, output_diagnostic_filename);

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% figure
% p1 = semilogy(mean(time_passes_DASVRDA_sc',1), mean(obj_value_DASVRDA_sc',1) - opt_value, mean(time_passes_DASVRDA_adres_sc',1), mean(obj_value_DASVRDA_adres_sc',1) - opt_value, mean(time_passes_DASVRDA_adres_sc_pflug',1), mean(obj_value_DASVRDA_adres_sc_pflug',1) - opt_value);
% p1(1).LineWidth = 2.5;
% p1(2).LineWidth = 2.5;
% p1(3).LineWidth = 2.5;
% 
% title(['Performance of DASVRDA sc']);
% xlabel('time in seconds');
% ylabel('objective gap P(x) - P(x*)');
% DASVRDA_legend = ['DASVRDA sc'];
% DASVRDA_adres_legend = ['DASVRDA adap grad restart sc'];
% DASVRDA_adres_pflug_legend = ['DASVRDA adap grad restart sc w/ pflug'];
% legend(DASVRDA_legend, DASVRDA_adres_legend, DASVRDA_adres_pflug_legend);
% saveas(gcf,'./output/ionosphere_2.jpg')
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%