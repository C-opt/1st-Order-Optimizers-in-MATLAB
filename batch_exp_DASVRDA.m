clc; clear; close;
output_filename = ('./output/exp_ionosphere_1.pdf');
output_diagnostic_filename = ('./output/exp_ionosphere_diagnostic_1.pdf');
load_ionosphere;

lambda1 = 0;
lambda2 = 10^(-6);

eta1 = 2*10^(1);
eta2 = 1*10^(1);
eta3 = 1*10^(1);
eta4 = 5*10^(0);

innerPt_no = 5;
number_of_experiments = 50;

S = 35;
exp_DASVRDA_sc;


clc; clear; close;
output_filename = ('./output/one_exp_ionosphere_1.pdf');
output_diagnostic_filename = ('./output/one_exp_ionosphere_diagnostic_1.pdf');
load_ionosphere;

lambda1 = 0;
lambda2 = 10^(-6);

eta1 = 2*10^(1);
eta2 = 1*10^(1);
eta3 = 1*10^(1);
eta4 = 5*10^(0);

innerPt_no = 5;
number_of_experiments = 1;

S = 35;
exp_DASVRDA_sc;


clc; clear; close;
output_filename = ('./output/exp_ionosphere_2.pdf');
output_diagnostic_filename = ('./output/exp_ionosphere_diagnostic_2.pdf');
load_ionosphere;

lambda1 = 10^(-4);
lambda2 = 10^(-6);

eta1 = 2*10^(1);
eta2 = 1*10^(1);
eta3 = 1*10^(1);
eta4 = 5*10^(0);

innerPt_no = 5;
number_of_experiments = 50;
S = 35;
exp_DASVRDA_sc;

clc; clear; close;
output_filename = ('./output/one_exp_ionosphere_2.pdf');
output_diagnostic_filename = ('./output/one_exp_ionosphere_diagnostic_2.pdf');
load_ionosphere;

lambda1 = 10^(-4);
lambda2 = 10^(-6);

eta1 = 2*10^(1);
eta2 = 1*10^(1);
eta3 = 1*10^(1);
eta4 = 5*10^(0);

innerPt_no = 5;
number_of_experiments = 1;
S = 35;
exp_DASVRDA_sc;

clc; clear; close;
output_filename = ('./output/exp_ionosphere_3.pdf');
output_diagnostic_filename = ('./output/exp_ionosphere_diagnostic_3.pdf');
load_ionosphere;

lambda1 = 10^(-4);
lambda2 = 0;

eta1 = 2*10^(1);
eta2 = 2*10^(1);
eta3 = 5*10^(0);

% 
innerPt_no = 5;
number_of_experiments = 50;
S = 150;
exp_DASVRDA_ns;

clc; clear; close;
output_filename = ('./output/one_exp_ionosphere_3.pdf');
output_diagnostic_filename = ('./output/one_exp_ionosphere_diagnostic_3.pdf');
load_ionosphere;

lambda1 = 10^(-4);
lambda2 = 0;

eta1 = 2*10^(1);
eta2 = 2*10^(1);
eta3 = 5*10^(0);

% 
innerPt_no = 5;
number_of_experiments = 1;
S = 150;
exp_DASVRDA_ns;

% 
% % %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% clc; clear; close;
% output_filename = ('./output/exp_spambase_1.pdf');
% output_diagnostic_filename = ('./output/exp_spambase_diagnostic_1.pdf');
% load_spambase;
% 
% lambda1 = 0;
% lambda2 = 10^(-6);
% 
% eta1 = 1*10^(1);
% eta2 = 1*10^(1);
% eta3 = 1*10^(1);
% eta4 = 5*10^(0);
% 
% innerPt_no = 5;
% number_of_experiments = 20;
% S = 50;
% exp_DASVRDA_sc;
% 
% 
% clc; clear; close;
% output_filename = ('./output/one_exp_spambase_1.pdf');
% output_diagnostic_filename = ('./output/one_exp_spambase_diagnostic_1.pdf');
% load_spambase;
% 
% lambda1 = 0;
% lambda2 = 10^(-6);
% 
% eta1 = 1*10^(1);
% eta2 = 1*10^(1);
% eta3 = 1*10^(1);
% eta4 = 5*10^(0);
% 
% innerPt_no = 5;
% number_of_experiments = 1;
% S = 50;
% exp_DASVRDA_sc;
% 
% 
% clc; clear; close;
% output_filename = ('./output/exp_spambase_2.pdf');
% output_diagnostic_filename = ('./output/exp_spambase_diagnostic_2.pdf');
% load_spambase;
% 
% lambda1 = 10^(-4);
% lambda2 = 10^(-6);
% 
% eta1 = 5*10^(0);
% eta2 = 5*10^(0);
% eta3 = 5*10^(0);
% eta4 = 5*10^(0);
% 
% innerPt_no = 5;
% number_of_experiments = 20;
% S = 50;
% exp_DASVRDA_sc;
% 
% clc; clear; close;
% output_filename = ('./output/one_exp_spambase_2.pdf');
% output_diagnostic_filename = ('./output/one_exp_spambase_diagnostic_2.pdf');
% load_spambase;
% 
% lambda1 = 10^(-4);
% lambda2 = 10^(-6);
% 
% eta1 = 5*10^(0);
% eta2 = 5*10^(0);
% eta3 = 5*10^(0);
% eta4 = 5*10^(0);
% 
% innerPt_no = 5;
% number_of_experiments = 1;
% S = 50;
% exp_DASVRDA_sc;
% 
% 
% clc; clear; close;
% output_filename = ('./output/exp_spambase_3.pdf');
% output_diagnostic_filename = ('./output/exp_spambase_diagnostic_3.pdf');
% load_spambase;
% 
% lambda1 = 10^(-4);
% lambda2 = 0;
% 
% eta1 = 5*10^(0);
% eta2 = 5*10^(0);
% eta3 = 5*10^(0);
% 
% innerPt_no = 5;
% number_of_experiments = 20;
% S = 300;
% exp_DASVRDA_ns;
% 
% clc; clear; close;
% output_filename = ('./output/one_exp_spambase_3.pdf');
% output_diagnostic_filename = ('./output/one_exp_spambase_diagnostic_3.pdf');
% load_spambase;
% 
% lambda1 = 10^(-4);
% lambda2 = 0;
% 
% eta1 = 5*10^(0);
% eta2 = 5*10^(0);
% eta3 = 5*10^(0);
% 
% innerPt_no = 5;
% number_of_experiments = 1;
% S = 300;
% exp_DASVRDA_ns;

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% clc; clear; close;
% output_filename = ('./output/exp_artificial_1.pdf');
% load_artificial;
% 
% lambda1 = 0;
% lambda2 = 10^(-6);
% 
% eta1 = 2*10^(1);
% eta2 = 1*10^(1);
% eta3 = 1*10^(1);
% eta4 = 5*10^(0);
% 
% innerPt_no = 5;
% number_of_experiments = 30;
% S = 100;
% exp_DASVRDA_sc;
% 
% 
% clc; clear; close;
% output_filename = ('./output/exp_artificial_2.pdf');
% load_artificial;
% 
% lambda1 = 10^(-4);
% lambda2 = 10^(-6);
% 
% eta1 = 1*10^(1);
% eta2 = 1*10^(1);
% eta3 = 1*10^(1);
% eta4 = 5*10^(0);
% 
% innerPt_no = 5;
% number_of_experiments = 30;
% S = 400;
% exp_DASVRDA_sc;
% 
% 
% clc; clear; close;
% output_filename = ('./output/exp_artificial_3_ns.pdf');
% load_artificial;
% 
% lambda1 = 10^(-4);
% lambda2 = 0;
% 
% eta1 = 5*10^(1);
% eta2 = 5*10^(1);
% eta3 = 5*10^(0);
% 
% innerPt_no = 5;
% number_of_experiments = 30;
% S = 500;
% exp_DASVRDA_ns;
% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% clc; clear; close;
% output_filename = ('./output/exp_a9a_1.pdf');
% load_a9a;
% 
% lambda1 = 0;
% lambda2 = 10^(-6);
% 
% eta1 = 2*10^(1);
% eta2 = 2*10^(1);
% eta3 = 2*10^(1);
% eta4 = 2*10^(0);
% 
% innerPt_no = 5;
% number_of_experiments = 30;
% S = 25;
% exp_DASVRDA_sc;
% 
% 
% clc; clear; close;
% output_filename = ('./output/exp_a9a_2.pdf');
% load_a9a;
% 
% lambda1 = 10^(-4);
% lambda2 = 10^(-6);
% 
% eta1 = 2*10^(1);
% eta2 = 2*10^(1);
% eta3 = 2*10^(1);
% eta4 = 5*10^(-1);
% 
% innerPt_no = 5;
% number_of_experiments = 30;
% S = 400;
% exp_DASVRDA_sc;
% 
% 
% clc; clear; close;
% output_filename = ('./output/exp_a9a_3_ns.pdf');
% load_a9a;
% 
% lambda1 = 10^(-4);
% lambda2 = 0;
% 
% eta1 = 2*10^(1);
% eta2 = 2*10^(1);
% eta3 = 5*10^(-1);
% 
% innerPt_no = 5;
% number_of_experiments = 30;
% S = 500;
% exp_DASVRDA_ns;
