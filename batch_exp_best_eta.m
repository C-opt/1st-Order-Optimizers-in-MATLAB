clc; clear; close;
number_of_experiments = 50;
lambda1 = 0;
lambda2 = 10^(-6);
output_filename = ('./output/best_eta_adap_ionosphere_1.jpg');
load_ionosphere;
exp_best_eta_sc

clc; clear; close;
number_of_experiments = 50;
lambda1 = 10^(-4);
lambda2 = 10^(-6);
output_filename = ('./output/best_eta_adap_ionosphere_2.jpg');
load_ionosphere;
exp_best_eta_sc

% 
% clc; clear; close;
% number_of_experiments = 50;
% lambda1 = 0;
% lambda2 = 10^(-6);
% output_filename = ('./output/best_eta_adap_spambase_1.jpg');
% load_spambase;
% exp_best_eta_sc
% 
% clc; clear; close;
% number_of_experiments = 50;
% lambda1 = 10^(-4);
% lambda2 = 10^(-6);
% output_filename = ('./output/best_eta_adap_spambase_2.jpg');
% load_spambase;
% exp_best_eta_sc
% 
% 
% clc; clear; close;
% number_of_experiments = 50;
% lambda1 = 0;
% lambda2 = 10^(-6);
% output_filename = ('./output/best_eta_adap_artificial_1.jpg');
% load_artificial;
% exp_best_eta_sc
% 
% clc; clear; close;
% number_of_experiments = 50;
% lambda1 = 10^(-4);
% lambda2 = 10^(-6);
% output_filename = ('./output/best_eta_adap_artificial_2.jpg');
% load_artificial;
% exp_best_eta_sc


% clc; clear; close;
% number_of_experiments = 50;
% lambda1 = 0;
% lambda2 = 10^(-6);
% output_filename = ('./output/best_eta_adap_a9a_1.jpg');
% load_a9a;
% exp_best_eta_sc
% 
% clc; clear; close;
% number_of_experiments = 50;
% lambda1 = 10^(-4);
% lambda2 = 10^(-6);
% output_filename = ('./output/best_eta_adap_a9a_2.jpg');
% load_a9a;
% exp_best_eta_sc

% clc; clear; close;
% output_filename = ('./output/best_eta_sido0_3.jpg');
% load_sido0;
% exp_best_eta_sc

% clc; clear; close;
% output_filename = ('./output/best_eta_rcv1_3.jpg');
% load_rcv1;
% exp_best_eta_sc
% 
% clc; clear; close;
% output_filename = ('./output/best_eta_artificial_3.jpg');
% load_artificial;
% exp_best_eta_sc