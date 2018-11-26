clc; clear; close;
output_filename = ('./output/best_eta_ionosphere_1.jpg');
load_ionosphere;
fprintf('ionosphere data has been loaded\n');
best_learning_rate_experiment

clc; clear; close;
output_filename = ('./output/best_eta_spambase_1.jpg');
load_spambase;
fprintf('spambase data has been loaded\n');
best_learning_rate_experiment

% clc; clear; close;
% output_filename = ('./output/best_eta_a9a.jpg');
% load_a9a;
% fprintf('a9a data has been loaded\n');
% best_learning_rate_experiment
% 
% clc; clear; close;
% output_filename = ('./output/best_eta_sido0.jpg');
% load_sido0;
% fprintf('sido0 data has been loaded\n');
% best_learning_rate_experiment
% 
% clc; clear; close;
% output_filename = ('./output/best_eta_rcv1.jpg');
% load_rcv1;
% fprintf('rcv1 data has been loaded\n');
% best_learning_rate_experiment