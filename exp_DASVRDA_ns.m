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

L_bar = sum(L)*1.0/data_size;
opt_eta = 1.0/((1 + omega*(m+1)/b)*L_bar);

parfor idx = 1: number_of_experiments
    fprintf('------------------------------EXPERIMENT NO. %d------------------------------\n', idx);                                                                                             
   [time_passes_DASVRDA_adres_sc(:,idx), obj_value_DASVRDA_ns(:,idx), w_DASVRDA_adres_sc] = DASVRDA_ns(X_train, Y_train, zeros(data_dim, 1), zeros(data_dim, 1), omega, L, m, b, S, eta1, lambda1, lambda2, 1, innerPt_no);
   [time_passes_DASVRDA_adres_sc_pflug(:,idx), obj_value_DASVRDA_pflug_ns(:,idx), w_DASVRDA_adres_sc_pflug] = DASVRDA_pflug_ns(X_train, Y_train, zeros(data_dim, 1), zeros(data_dim, 1), omega, L, m, b, S, eta2, lambda1, lambda2, 1, innerPt_no); 
end

figure
p2 = semilogy(data_passes_DASVRDA, mean(obj_value_DASVRDA_ns',1) - opt_value, data_passes_DASVRDA, mean(obj_value_DASVRDA_pflug_ns',1) - opt_value);
p2(1).LineWidth = 2.5;
p2(2).LineWidth = 2.5;

title(['Experiments']);
xlabel('#(gradients computed)/n');
ylabel('objective gap P(x) - P(x*)');
DASVRDA_ns_legend = ['DASVRDA'];
DASVRDA_pflug_ns_legend = ['Pflug + DASRVDA'];
legend(DASVRDA_ns_legend, DASVRDA_pflug_ns_legend);
saveas(gcf,output_filename)
