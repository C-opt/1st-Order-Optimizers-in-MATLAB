function result = LogR2Gradient_VR(lambda, data_idx, w, X_plus, X_minus, x_plus_avg, x_minus_avg, X, Y, A)

[line_no, batch_size] = size(data_idx);
[data_dim, data_size] = size(X);
sum = 0;

for i = 1 : batch_size
    if(Y(data_idx(i)) == +1)
        sum = sum + LogR2Gradient(lambda, data_idx(i), w, X, Y) - A'*(h_plus(lambda, data_idx(i), w, X, x_plus_avg) - total_expectation(lambda, w, X_minus, X_plus, x_minus_avg, x_plus_avg));
    end
    if(Y(data_idx(i)) == -1)
        sum = sum + LogR2Gradient(lambda, data_idx(i), w, X, Y) - A'*(h_minus(lambda, data_idx(i), w, X, x_minus_avg) - total_expectation(lambda, w, X_minus, X_plus, x_minus_avg, x_plus_avg));
    end    
end
result = 1.0*sum / batch_size;

    function result_plus = expectation_plus(lambda, w, X_plus, x_plus_avg)
        z_hat_plus = - w' * x_plus_avg;
        result_plus = w * lambda - sigma(z_hat_plus)*(x_plus_avg*(1 - sigma(-z_hat_plus)*z_hat_plus) - sigma(-z_hat_plus) * (cov(X_plus') + x_plus_avg * x_plus_avg') * w);
    end

    function result_minus = expectation_minus(lambda, w, X_minus, x_minus_avg)
        z_hat_minus = w' * x_minus_avg;
        result_minus = w * lambda + sigma(z_hat_minus)*(x_minus_avg*(1 - sigma(-z_hat_minus)*z_hat_minus) + sigma(-z_hat_minus) * (cov(X_minus') + x_minus_avg * x_minus_avg') * w);
    end

    function expect = total_expectation(lambda, w, X_minus, X_plus, x_minus_avg, x_plus_avg)
        [data_dim, data_size_plus] = size(X_plus);
        [data_dim, data_size_minus] = size(X_minus);
        data_size = data_size_minus + data_size_plus;
        expect = (data_size_minus/data_size) * expectation_minus(lambda, w, X_minus, x_minus_avg) + (data_size_plus/data_size)*expectation_plus(lambda, w, X_plus, x_plus_avg);
    end 
    
end