function prox = prox_map(z, lambda_1, lambda_2)
    prox = (1/(1+lambda_2)).*sign(z).*max(0,abs(z)-lambda_1);
end