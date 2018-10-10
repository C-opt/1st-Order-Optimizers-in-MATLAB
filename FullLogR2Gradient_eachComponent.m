function [result, eachComponent]= FullLogR2Gradient_eachComponent(lambda, w, X, Y)

    [data_dim, data_size] = size(X);
    TMP = (Y.*X);
    AAA = exp(w' *TMP);
    BBB = ones(1, data_size);
    SIGMA_INV = AAA + BBB;
    SIGMA = 1./SIGMA_INV;
    SUM = (-TMP).*SIGMA;
    mean_SUM = mean(SUM');
    mean_SUM = mean_SUM';
    eachComponent = SUM + w * lambda;
    result = mean_SUM + w * lambda;
    
end