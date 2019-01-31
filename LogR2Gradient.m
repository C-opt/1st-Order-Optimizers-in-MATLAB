function result = LogR2Gradient(lambda, data_idx, w, X, Y)

[~, batch_size] = size(data_idx);

% sum = 0;
% 
% for i = 1 : batch_size
%     sum = sum - Y(data_idx(i)) * X(:, data_idx(i)) * sigma(-Y(data_idx(i)) * w' * X(:, data_idx(i)));
% end
% 
% result = sum / batch_size + w * lambda;

AA = -Y(data_idx) .* X(:, data_idx);
BB = 1./(1 + exp(-AA'*w));
CC = AA.*BB';
DD = ones(batch_size, 1);
result = CC*DD/batch_size + w * lambda;