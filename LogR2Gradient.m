function result = LogR2Gradient(lambda, data_idx, w, X, Y)

[line_no, batch_size] = size(data_idx);
sum = 0;

for i = 1 : batch_size
    sum = sum - Y(data_idx(i)) * X(:, data_idx(i)) * sigma(-Y(data_idx(i)) * w' * X(:, data_idx(i)));
end

result = sum / batch_size + w * lambda;