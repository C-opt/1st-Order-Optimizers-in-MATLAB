clc; clear; close;
number_of_experiments = 50;
lambda1 = 0;
lambda2 = 10^(-6);
S = 150;
T = 1;
output_filename = ('./output/best_eta_DASVRDA_adapRestart_ionosphere_1.pdf');
load_ionosphere;
exp_best_eta_sc

clc; clear; close;
number_of_experiments = 50;
lambda1 = 10^(-4);
lambda2 = 10^(-6);
S = 150;
T = 1;
output_filename = ('./output/best_eta_DASVRDA_adapRestart_ionosphere_2.pdf');
load_ionosphere;
exp_best_eta_sc

clc; clear; close;
number_of_experiments = 50;
lambda1 = 10^(-4);
lambda2 = 0;
S = 150;
T = 1;
output_filename = ('./output/best_eta_DASVRDA_adapRestart_ionosphere_3.pdf');
load_ionosphere;
exp_best_eta_ns

clc; clear; close;
number_of_experiments = 10;
lambda1 = 0;
lambda2 = 10^(-6);
S = 150;
T = 1;
output_filename = ('./output/best_eta_DASVRDA_adapRestart_spambase_1.pdf');
load_spambase;
exp_best_eta_sc
% 
clc; clear; close;
number_of_experiments = 50;
lambda1 = 10^(-4);
lambda2 = 10^(-6);
S = 150;
T = 1;
output_filename = ('./output/best_eta_DASVRDA_adapRestart_spambase_2.pdf');
load_spambase;
exp_best_eta_sc
% 

clc; clear; close;
number_of_experiments = 50;
lambda1 = 10^(-4);
lambda2 = 0;
S = 150;
T = 1;
output_filename = ('./output/best_eta_DASVRDA_adapRestart_spambase_3.pdf');
load_spambase;
exp_best_eta_ns

% 
% 
% clc; clear; close;
% number_of_experiments = 50;
% lambda1 = 0;
% lambda2 = 10^(-6);
% output_filename = ('./output/best_eta_SVRG_artificial_1.jpg');
% load_artificial;
% exp_best_eta_sc
% 
% clc; clear; close;
% number_of_experiments = 50;
% lambda1 = 10^(-4);
% lambda2 = 10^(-6);
% output_filename = ('./output/best_eta_SVRG_artificial_2.jpg');
% load_artificial;
% exp_best_eta_sc

% clc; clear; close;
% output_filename = ('./output/best_eta_SVRG_artificial_3.jpg');
% lambda1 = 10^(-4);
% lambda2 = 0;
% load_artificial;
% exp_best_eta_sc

clc; clear; close;
number_of_experiments = 20;
lambda1 = 0;
lambda2 = 10^(-6);
output_filename = ('./output/best_eta_DASVRDA_adapRestart_a9a_1.pdf');
S = 150;
T = 1;
load_a9a;
exp_best_eta_sc
% 
clc; clear; close;
number_of_experiments = 20;
lambda1 = 10^(-4);
lambda2 = 10^(-6);
output_filename = ('./output/best_eta_DASVRDA_adapRestart_a9a_2.jpg');
S = 150;
T = 1;
load_a9a;
exp_best_eta_sc

clc; clear; close;
number_of_experiments = 20;
lambda1 = 10^(-4);
lambda2 = 0;
output_filename = ('./output/best_eta_DASVRDA_adapRestart_a9a_3.jpg');
S = 150;
T = 1;
load_a9a;
exp_best_eta_ns

% clc; clear; close;
% output_filename = ('./output/best_eta_sido0_1.jpg');
% lambda1 = 0;
% lambda2 = 10^(-6);
% load_sido0;
% exp_best_eta_sc

% clc; clear; close;
% output_filename = ('./output/best_eta_sido0_2.jpg');
% lambda1 = 10^(-4);
% lambda2 = 10^(-6);
% load_sido0;
% exp_best_eta_sc

% clc; clear; close;
% output_filename = ('./output/best_eta_DASVRDA_adapRestart_sido0_3.jpg');
% lambda1 = 10^(-4);
% lambda2 = 0;
% load_sido0;
% exp_best_eta_ns
% 
% clc; clear; close;
% output_filename = ('./output/best_eta_DASVRDA_adapRestart_rcv1_3.jpg');
% lambda1 = 10^(-4);
% lambda2 = 0;
% load_rcv1;
% exp_best_eta_ns
