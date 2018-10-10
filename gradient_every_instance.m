function [G,H] = gradient_every_instance(lambda, w, X, x_plus_avg, x_minus_avg, Y)
    [~, data_size] = size(X);

    G = zeros(size(X));
    H = zeros(size(X));
    for i = 1: data_size
        G(:,i) = (LogR2Gradient(lambda, i, w, X, Y));
        if(Y(i) == +1)
            H(:,i) = (h_plus(lambda, i, w, X, x_plus_avg));
        end
        if(Y(i) == -1)
            H(:,i) = (h_minus(lambda, i, w, X, x_minus_avg));
        end
    end
end