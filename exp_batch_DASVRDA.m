clc; clear; close;
output_filename = ('./output/exp_ionosphere_ns_1.jpg');
load_ionosphere;

lambda1 = 10^(-4);
lambda2 = 0;

eta1 = 2*10^(1);
eta2 = 1*10^(1);

innerPt_no = 3;
number_of_experiments = 500;
exp_DASVRDA_ns;

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% clc; clear; close;
% output_filename = ('./output/exp_ionosphere_2.jpg');
% load_ionosphere;
% 
% lambda1 = 10^(-4);
% lambda2 = 10^(-6);
% 
% eta1 = 2*10^(1);
% eta2 = 1*10^(1);
% eta3 = 1*10^(1);
% 
% innerPt_no = 3;
% number_of_experiments = 40;
% exp_DASVRDA_ns;