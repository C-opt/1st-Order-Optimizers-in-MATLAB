max_iter = 10^6;

[data_dim, data_size] = size(X_train);

b = ceil(sqrt(data_size));
L = 0.25*ones(data_size,1);
m = ceil(1.0*data_size/b);
omega = 0.5*(3 + sqrt(9 + 8.0*b/(m+1)));

S = 150;
T = 1;
S_adres = S*T;

innerPt_no = 3;

[~, ~, w_DASVRDA_sc] = DASVRDA_sc(X_train, Y_train, zeros(data_dim, 1), omega, L, m, b, 40, 10, 5*10^(0), lambda1, lambda2, 0, innerPt_no);
[opt_value, ~] = optimizer_APG(X_train, Y_train, w_DASVRDA_sc, lambda1, lambda2, max_iter, 10^(-6));

data_passes_DASVRDA_sc = DASVRDA_dataPass(data_size, m, b, S, T, innerPt_no);
tmp = floor(20:size(data_passes_DASVRDA_sc,1)/10:size(data_passes_DASVRDA_sc,1));

eta = zeros(1,15);
count = 1;
for i = -2:1:2
    for j = 1:3
        eta(count) = (j^2 - 2*j + 2)*10^(i);
        count = count + 1;
    end
end

figure
xlabel('#(gradients computed)/n');
ylabel('objective gap P(x) - P(x*)');

min_idx = -1;
min_mean = obj_logreg_r1r2(lambda1, lambda2, zeros(data_dim, 1), X_train, Y_train);
last_idx = T*S*(innerPt_no+1)+1;
Legend = cell(size(eta, 2),1);

for eta_idx = 1:size(eta, 2)
    tmp_eta = eta(eta_idx);
    
    fprintf('eta = %1.2f\n', tmp_eta);
    parfor exp_idx = 1: number_of_experiments
        %fprintf('---EXPERIMENT NO. %d---\n', exp_idx);
        [~, obj_value_DASVRDA_sc_1(:,exp_idx), ~] = DASVRDA_adapRestart_ns(X_train, Y_train, zeros(data_dim, 1), zeros(data_dim, 1), omega, L, m, b, S, tmp_eta, lambda1, lambda2, 1, innerPt_no);
        %[~, ~, time_passes_DASVRDA_sc_1(:,exp_idx), obj_value_DASVRDA_sc_1(:,exp_idx), ~] = DASVRDA_adapRestart_pflug_ns(X_train, Y_train, zeros(data_dim, 1), zeros(data_dim, 1), omega, L, m, b, S, tmp_eta, lambda1, lambda2, 1, innerPt_no);
    end
    mean_1 = mean(obj_value_DASVRDA_sc_1, 2);
    
    if(mean_1(last_idx) < min_mean)
       min_mean = mean_1(last_idx);
       min_idx = eta_idx;
    end
    
    Legend{eta_idx} = num2str(eta_idx);
   
    if eta_idx == 1    
        gr1 = semilogy(data_passes_DASVRDA_sc, mean_1 - opt_value, '-bs'); hold on;
        gr1.MarkerIndices = tmp;
    elseif eta_idx == 2
        gr2 = semilogy(data_passes_DASVRDA_sc, mean_1 - opt_value, '-bo'); hold on;
        gr2.MarkerIndices = tmp;
    elseif eta_idx == 3
        gr3 = semilogy(data_passes_DASVRDA_sc, mean_1 - opt_value, '-bp'); hold on;
        gr3.MarkerIndices = tmp;
    elseif eta_idx == 4
        gr4 = semilogy(data_passes_DASVRDA_sc, mean_1 - opt_value, '-bh'); hold on;
        gr4.MarkerIndices = tmp;
    elseif eta_idx == 5
        gr5 = semilogy(data_passes_DASVRDA_sc, mean_1 - opt_value, '-rs'); hold on;
        gr5.MarkerIndices = tmp;
    elseif eta_idx == 6
        gr6 = semilogy(data_passes_DASVRDA_sc, mean_1 - opt_value, '-ro'); hold on;
        gr6.MarkerIndices = tmp;
    elseif eta_idx == 7   
        gr7 = semilogy(data_passes_DASVRDA_sc, mean_1 - opt_value, '-rp'); hold on;
        gr7.MarkerIndices = tmp;
    elseif eta_idx == 8
        gr8 = semilogy(data_passes_DASVRDA_sc, mean_1 - opt_value, '-rh'); hold on;
        gr8.MarkerIndices = tmp;
    elseif eta_idx == 9
        gr9 = semilogy(data_passes_DASVRDA_sc, mean_1 - opt_value, '-ks'); hold on;
        gr9.MarkerIndices = tmp;
    elseif eta_idx == 10
        gr10 = semilogy(data_passes_DASVRDA_sc, mean_1 - opt_value, '-ko'); hold on;
        gr10.MarkerIndices = tmp;
    elseif eta_idx == 11
        gr11 = semilogy(data_passes_DASVRDA_sc, mean_1 - opt_value, '-kp'); hold on;
        gr11.MarkerIndices = tmp;
    elseif eta_idx == 12
        gr12 = semilogy(data_passes_DASVRDA_sc, mean_1 - opt_value, '-kh'); hold on;
        gr12.MarkerIndices = tmp;
    elseif eta_idx == 13
        gr13 = semilogy(data_passes_DASVRDA_sc, mean_1 - opt_value, '-ms'); hold on;
        gr13.MarkerIndices = tmp;
    elseif eta_idx == 14
        gr14 = semilogy(data_passes_DASVRDA_sc, mean_1 - opt_value, '-mo'); hold on;
        gr14.MarkerIndices = tmp;
    elseif eta_idx == 15
        gr15 = semilogy(data_passes_DASVRDA_sc, mean_1 - opt_value, '-mp'); hold on;
        gr15.MarkerIndices = tmp;
    end
end
legend(Legend);
title(['Performance of AdapRes DASVRDA (min idx = ' num2str(min_idx) ')']);
set(gcf, 'color', 'w');
export_fig(output_filename);
hold off