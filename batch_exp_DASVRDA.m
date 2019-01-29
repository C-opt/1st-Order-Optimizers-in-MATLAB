% clc; clear; close;
% output_filename = ('./output/tmp_1.pdf');
% output_diagnostic_filename = ('./output/tmp_diagnostic_1.pdf');
% load_spambase;
% 
% lambda1 = 10^(-4);
% lambda2 = 0;
% 
% eta1 = 5*10^(0);
% eta2 = 5*10^(2);
% eta3 = 5*10^(0);
% 
% innerPt_no = 3;
% number_of_experiments = 10;
% S = 200;
% T = 5;
% exp_DASVRDA_ns;


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

innerPt_no = 3;
number_of_experiments = 50;

S = 25;
T = 5;
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

innerPt_no = 3;
number_of_experiments = 50;
S = 25;
T = 5;
exp_DASVRDA_sc;

clc; clear; close;
output_filename = ('./output/exp_ionosphere_3.pdf');
output_diagnostic_filename = ('./output/exp_ionosphere_diagnostic_3.pdf');
load_ionosphere;

lambda1 = 10^(-4);
lambda2 = 0;

eta1 = 5*10^(0);
eta2 = 2*10^(1);
eta3 = 5*10^(0);
eta4 = eta3;

innerPt_no = 3;
number_of_experiments = 50;
S = 200;
T = 5;
exp_DASVRDA_ns;

%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
clc; clear; close;
output_filename = ('./output/exp_spambase_1.pdf');
output_diagnostic_filename = ('./output/exp_spambase_diagnostic_1.pdf');
load_spambase;

lambda1 = 0;
lambda2 = 10^(-6);

eta1 = 1*10^(1);
eta2 = 1*10^(1);
eta3 = 1*10^(1);
eta4 = 5*10^(0);

innerPt_no = 3;
number_of_experiments = 50;
S = 25;
T = 5;
exp_DASVRDA_sc;


clc; clear; close;
output_filename = ('./output/exp_spambase_2.pdf');
output_diagnostic_filename = ('./output/exp_spambase_diagnostic_2.pdf');
load_spambase;

lambda1 = 10^(-4);
lambda2 = 10^(-6);

eta1 = 5*10^(0);
eta2 = 5*10^(0);
eta3 = 5*10^(0);
eta4 = 5*10^(0);

innerPt_no = 3;
number_of_experiments = 50;
S = 25;
T = 5;
exp_DASVRDA_sc;



clc; clear; close;
output_filename = ('./output/exp_spambase_3.pdf');
output_diagnostic_filename = ('./output/exp_spambase_diagnostic_3.pdf');
load_spambase;

lambda1 = 10^(-4);
lambda2 = 0;

eta1 = 5*10^(0);
eta2 = 5*10^(0);
eta3 = 1*10^(1);
eta4 = eta3;

innerPt_no = 3;
number_of_experiments = 20;
S = 200;
T = 5;
exp_DASVRDA_ns;

%
clc; clear; close;
output_filename = ('./output/exp_a9a_1.pdf');
output_diagnostic_filename = ('./output/exp_a9a_diagnostic_1.pdf');
load_a9a;

lambda1 = 0;
lambda2 = 10^(-6);

eta1 = 2*10^(1);
eta2 = 2*10^(1);
eta3 = 2*10^(1);
eta4 = 2*10^(0);

innerPt_no = 3;
number_of_experiments = 20;
S = 25;
T = 2;
exp_DASVRDA_sc;


clc; clear; close;
output_filename = ('./output/exp_a9a_2.pdf');
output_diagnostic_filename = ('./output/exp_a9a_diagnostic_2.pdf');
load_a9a;

lambda1 = 10^(-4);
lambda2 = 10^(-6);

eta1 = 2*10^(1);
eta2 = 2*10^(1);
eta3 = 2*10^(1);
eta4 = 5*10^(-1);

innerPt_no = 3;
number_of_experiments = 20;
S = 25;
T = 2;
exp_DASVRDA_sc;


clc; clear; close;
output_filename = ('./output/exp_a9a_3.pdf');
output_diagnostic_filename = ('./output/exp_a9a_diagnostic_3.pdf');
load_a9a;

lambda1 = 10^(-4);
lambda2 = 0;

eta1 = 5*10^(-1);
eta2 = 2*10^(1);
eta3 = 2*10^(1);
eta4 = eta3;

innerPt_no = 3;
number_of_experiments = 20;
S = 40;
T = 5;
exp_DASVRDA_ns;

%
clc; clear; close;
output_filename = ('./output/exp_sido0_1.pdf');
output_diagnostic_filename = ('./output/exp_sido0_diagnostic_1.pdf');
load_sido0;

lambda1 = 0;
lambda2 = 10^(-6);

eta1 = 5*10^(0);
eta2 = 5*10^(0);
eta3 = 5*10^(0);
eta4 = 1*10^(1);

innerPt_no = 3;
number_of_experiments = 20;
S = 25;
T = 5;
exp_DASVRDA_sc;


clc; clear; close;
output_filename = ('./output/exp_sido0_2.pdf');
output_diagnostic_filename = ('./output/exp_sido0_diagnostic_2.pdf');
load_sido0;

lambda1 = 10^(-4);
lambda2 = 10^(-6);

eta1 = 5*10^(2);
eta2 = 5*10^(2);
eta3 = 5*10^(2);
eta4 = 2*10^(1);

innerPt_no = 3;
number_of_experiments = 20;
S = 25;
T = 5;
exp_DASVRDA_sc;


clc; clear; close;
output_filename = ('./output/exp_sido0_3.pdf');
output_diagnostic_filename = ('./output/exp_sido0_diagnostic_3.pdf');
load_sido0;

lambda1 = 10^(-4);
lambda2 = 0;

eta1 = 2*10^(1);
eta2 = 5*10^(2);
eta3 = 5*10^(2);
eta4 = eta3;

innerPt_no = 3;
number_of_experiments = 20;
S = 200;
T = 5;
exp_DASVRDA_ns;