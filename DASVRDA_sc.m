function  [time_passes, obj_value, w] = DASVRDA_sc(X_train, Y_train, x_invhat, omega, L, m, b, S, T, eta, lambda1, lambda2, experiment_boolean, innerPt_no)
    
    innerPt_no = min(floor(sqrt(m)), innerPt_no);
    obj_value = zeros(T*S*(1 + innerPt_no)+1, 1);
    time_passes = zeros(T*S*(1 + innerPt_no)+1, 1);
    
    t2 = 0;
    for t = 1: T
        tic
        [tmp, obj_value((t-1)*S*(1 + innerPt_no) + 1: t*S*(1 + innerPt_no)+1,:), x_invhat] = DASVRDA_ns(X_train, Y_train, x_invhat, x_invhat, omega, L, m, b, S, eta, lambda1, lambda2, experiment_boolean, innerPt_no);
        tmp = tmp + t2;
        t2 = t2 + toc;
        time_passes((t-1)*S*(1+innerPt_no)+1:t*S*(1+innerPt_no)+1,:) = tmp;
    end
    w = x_invhat;
end