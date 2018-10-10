function result = obj_logreg_r1r2(lambda1, lambda2, w, X, Y)
[data_dim, data_size] = size(X);

AAA = -w'*(Y.*X);
BBB = exp(AAA);
CCC = ones(size(BBB));
DDD = log(CCC + BBB);

result = (DDD)*CCC'/data_size + 0.5*lambda2*(w'*w) + lambda1*(abs(w)'*ones(data_dim,1));