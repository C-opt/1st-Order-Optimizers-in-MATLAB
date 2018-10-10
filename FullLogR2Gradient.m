function result = FullLogR2Gradient(lambda, w, X, Y)

    [data_dim, data_size] = size(X);
    AAA = exp(w' *(Y.*X));
    BBB = ones(1, data_size);
    SIGMA_INV = AAA + BBB;
    SIGMA = 1./SIGMA_INV;
    SUM = (-Y.*X).*SIGMA;
    mean_SUM = mean(SUM');
    mean_SUM = mean_SUM';
    result = mean_SUM + w * lambda;
    
end