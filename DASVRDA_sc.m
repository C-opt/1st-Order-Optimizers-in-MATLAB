function  [data_passes, obj_value, w] = DASVRDA_sc(X_train, Y_train, x_invhat, omega, L, m, b, S, T, lambda1, lambda2, pflug_boolean)
    
    [data_dim, data_size] = size(X_train);
    obj_value = zeros(T*S*(1 + m) + 1, 1);
    data_passes = zeros(T*S*(1 + m) + 1, 1);
    
    count = 1;
    for t = 1: T
        for s = 1: S
            count = count + 1;
            data_passes(count) = data_passes(count-1)+1;
            for k = 1: m
                count = count + 1;
                data_passes(count) = data_passes(count-1) + 1.0*b/data_size;
            end
        end
    end
    
    for t = 1: T
        [~, obj_value((t-1)*S*(1 + m) + 1: t*S*(1 + m) + 1,:), x_invhat] = DASVRDA_ns(X_train, Y_train, x_invhat, x_invhat, omega, L, m, b, S, lambda1, lambda2, pflug_boolean);
    end
    w = x_invhat;
end