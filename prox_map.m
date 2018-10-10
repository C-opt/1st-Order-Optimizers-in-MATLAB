function prox = prox_map(z, lambda_1, lambda_2)
    [dim, ~] = size(z);
    prox = zeros(size(z));
    
    for i = 1: dim
        %prox(i) = (1/(1+lambda_2))*sign(z(i))*max(0, abs(z(i)) - lambda_1);
    end
    prox = (1/(1+lambda_2)).*sign(z).*max(0,abs(z)-lambda_1);
end