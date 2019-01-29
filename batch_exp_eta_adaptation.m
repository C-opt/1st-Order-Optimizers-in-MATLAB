clc; clear; close;
output_filename_over = ('./output/exp_ionosphere_etaOver_1.pdf');
output_filename_under= ('./output/exp_ionosphere_etaUnder_1.pdf');
load_ionosphere;

lambda1 = 0;
lambda2 = 10^(-6);

eta1 = 1*10^(1);
eta2 = eta1*10^(+2);
eta3 = eta1*10^(-2);

innerPt_no = 3;
number_of_experiments = 50;

S = 100;
T = 5;
exp_eta_adap_sc;

clc; clear; close;
output_filename_over = ('./output/exp_ionosphere_etaOver_2.pdf');
output_filename_under= ('./output/exp_ionosphere_etaUnder_2.pdf');
load_ionosphere;

lambda1 = 10^(-4);
lambda2 = 10^(-6);

eta1 = 1*10^(1);
eta2 = eta1*10^(+2);
eta3 = eta1*10^(-2);

innerPt_no = 3;
number_of_experiments = 50;

S = 100;
T = 5;
exp_eta_adap_sc;

clc; clear; close;
output_filename_over = ('./output/exp_ionosphere_etaOver_3.pdf');
output_filename_under= ('./output/exp_ionosphere_etaUnder_3.pdf');
load_ionosphere;

lambda1 = 10^(-4);
lambda2 = 0;

eta1 = 5*10^(0);
eta2 = eta1*10^(+2);
eta3 = eta1*10^(-2);

innerPt_no = 3;
number_of_experiments = 50;

S = 100;
T = 5;
exp_eta_adap_ns;
%%
clc; clear; close;
output_filename_over = ('./output/exp_spambase_etaOver_1.pdf');
output_filename_under= ('./output/exp_spambase_etaUnder_1.pdf');
load_spambase;

lambda1 = 0;
lambda2 = 10^(-6);

eta1 = 1*10^(1);
eta2 = eta1*10^(+2);
eta3 = eta1*10^(-2);

innerPt_no = 3;
number_of_experiments = 50;

S = 100;
T = 5;
exp_eta_adap_sc;

clc; clear; close;
output_filename_over = ('./output/exp_spambase_etaOver_2.pdf');
output_filename_under= ('./output/exp_spambase_etaUnder_2.pdf');
load_spambase;

lambda1 = 10^(-4);
lambda2 = 10^(-6);

eta1 = 5*10^(0);
eta2 = eta1*10^(+2);
eta3 = eta1*10^(-2);

innerPt_no = 3;
number_of_experiments = 50;

S = 100;
T = 5;
exp_eta_adap_sc;

clc; clear; close;
output_filename_over = ('./output/exp_spambase_etaOver_3.pdf');
output_filename_under= ('./output/exp_spambase_etaUnder_3.pdf');
load_spambase;

lambda1 = 10^(-4);
lambda2 = 0;

eta1 = 1*10^(1);
eta2 = eta1*10^(+2);
eta3 = eta1*10^(-2);

innerPt_no = 3;
number_of_experiments = 50;

S = 100;
T = 5;
exp_eta_adap_ns;
%%
clc; clear; close;
output_filename_over = ('./output/exp_a9a_etaOver_1.pdf');
output_filename_under= ('./output/exp_a9a_etaUnder_1.pdf');
load_a9a;

lambda1 = 0;
lambda2 = 10^(-6);

eta1 = 2*10^(1);
eta2 = eta1*10^(+2);
eta3 = eta1*10^(-2);

innerPt_no = 3;
number_of_experiments = 50;

S = 100;
T = 5;
exp_eta_adap_sc;

clc; clear; close;
output_filename_over = ('./output/exp_a9a_etaOver_2.pdf');
output_filename_under= ('./output/exp_a9a_etaUnder_2.pdf');
load_a9a;

lambda1 = 10^(-4);
lambda2 = 10^(-6);

eta1 = 2*10^(1);
eta2 = eta1*10^(+2);
eta3 = eta1*10^(-2);

innerPt_no = 3;
number_of_experiments = 50;

S = 100;
T = 5;
exp_eta_adap_sc;

clc; clear; close;
output_filename_over = ('./output/exp_a9a_etaOver_3.pdf');
output_filename_under= ('./output/exp_a9a_etaUnder_3.pdf');
load_a9a;

lambda1 = 10^(-4);
lambda2 = 0;

eta1 = 2*10^(1);
eta2 = eta1*10^(+2);
eta3 = eta1*10^(-2);

innerPt_no = 3;
number_of_experiments = 50;

S = 100;
T = 5;
exp_eta_adap_ns;
%%
clc; clear; close;
output_filename_over = ('./output/exp_sido0_etaOver_1.pdf');
output_filename_under= ('./output/exp_sido0_etaUnder_1.pdf');
load_sido0;

lambda1 = 0;
lambda2 = 10^(-6);

eta1 = 5*10^(0);
eta2 = eta1*10^(+2);
eta3 = eta1*10^(-2);

innerPt_no = 3;
number_of_experiments = 50;

S = 100;
T = 5;
exp_eta_adap_sc;

clc; clear; close;
output_filename_over = ('./output/exp_sido0_etaOver_2.pdf');
output_filename_under= ('./output/exp_sido0_etaUnder_2.pdf');
load_sido0;

lambda1 = 10^(-4);
lambda2 = 10^(-6);

eta1 = 5*10^(2);
eta2 = eta1*10^(+2);
eta3 = eta1*10^(-2);

innerPt_no = 3;
number_of_experiments = 50;

S = 100;
T = 5;
exp_eta_adap_sc;

clc; clear; close;
output_filename_over = ('./output/exp_sido0_etaOver_3.pdf');
output_filename_under= ('./output/exp_sido0_etaUnder_3.pdf');
load_sido0;

lambda1 = 10^(-4);
lambda2 = 0;

eta1 = 5*10^(2);
eta2 = eta1*10^(+2);
eta3 = eta1*10^(-2);

innerPt_no = 3;
number_of_experiments = 50;

S = 100;
T = 5;
exp_eta_adap_ns;