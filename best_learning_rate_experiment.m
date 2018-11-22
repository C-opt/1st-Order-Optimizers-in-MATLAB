
max_iter = 10^6;
number_of_experiments = 40;

[data_dim, data_size] = size(X_train);
lambda1 = 0;
lambda2 = 10^(-6);

b = ceil(sqrt(data_size));
L = 0.25*ones(data_size,1);
m = ceil(1.0*data_size/b);
omega = 0.5*(3 + sqrt(9 + 8.0*b/(m+1)));

S = 20;
T = 3;
S_adres = S*T;

innerPt_no = 3;

[~, ~, w_DASVRDA_sc] = DASVRDA_sc(X_train, Y_train, zeros(data_dim, 1), omega, L, m, b, 40, 10, 5*10^(0), lambda1, lambda2, 0, innerPt_no);
[opt_value, w] = optimizer_APG(X_train, Y_train, w_DASVRDA_sc, lambda1, lambda2, max_iter, 10^(-6));

data_passes_DASVRDA_sc = DASVRDA_dataPass(data_size, m, b, S, T, innerPt_no);

eta = zeros(1,9);
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

for eta_idx = 1:size(eta, 2)
    tmp_eta = eta(eta_idx);
    
    fprintf('eta = %1.2f\n', tmp_eta);
    parfor exp_idx = 1: number_of_experiments
%         fprintf('---EXPERIMENT NO. %d---\n', exp_idx);
        [time_passes_DASVRDA_sc_1(:,exp_idx), obj_value_DASVRDA_sc_1(:,exp_idx), ~] = DASVRDA_sc(X_train, Y_train, zeros(data_dim, 1), omega, L, m, b, S, T, tmp_eta, lambda1, lambda2, 1, innerPt_no);
    end
    mean_1 = mean(obj_value_DASVRDA_sc_1, 2);
    
    if(mean_1(last_idx) < min_mean)
       min_mean = mean_1(last_idx);
       min_idx = eta_idx;
    end
    
    gr1 = semilogy(data_passes_DASVRDA_sc, mean_1 - opt_value);  hold on;
    set(gr1(1), 'linewidth', 2.5);
end
title(['Performance of DASVRDA (min idx = ' num2str(min_idx) ')']);
saveas(gcf,output_filename)
hold off