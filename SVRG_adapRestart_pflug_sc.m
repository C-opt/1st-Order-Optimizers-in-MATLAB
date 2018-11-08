function  [data_passes, time_passes, obj_value, w] = SVRG_adapRestart_pflug_sc(X_train, Y_train, x_tilde, omega, L, m, b, S, eta, lambda1, lambda2)
    

    [data_dim, data_size] = size(X_train);
    y_tilde = zeros(data_dim, 1);
    
    obj_value = zeros(S*(1 + m) + 1, 1);
    data_passes = zeros(S*(1 + m) + 1, 1);
    time_passes = zeros(S*(1 + m) + 1, 1);
    
    count = 1;
    obj_value(count) = obj_logreg_r1r2(lambda1, lambda2, x_tilde, X_train, Y_train);
    z_tilde = x_tilde;
    x_tilde_previous = z_tilde;
    theta_tilde = 1.0 - 1.0/omega;
    
    S_pflug = 0;
    tau = 0;
    burnin = floor(1.0*S*(1 + m)/10.0);
    tic
    for s = 1: S
        count = count + 1;
        obj_value(count) = obj_value(count-1);

        theta_tilde_previous = theta_tilde;
        
        theta_tilde = (1.0 - 1.0/omega)*(s+2)*0.5;
        y_tilde_previous = y_tilde;
        y_tilde = x_tilde + (theta_tilde_previous - 1)/theta_tilde * (x_tilde - x_tilde_previous) + theta_tilde_previous/theta_tilde * (z_tilde - x_tilde);
        
       % if((y_tilde_previous - x_tilde)'*(y_tilde - x_tilde) > 0)
           %theta_tilde =  1.0 - 1.0/omega;
      %  end
        
        time_passes(count) = toc;
        data_passes(count) = data_passes(count-1) + 1;
        
        [full_gradient, eachComponent] = FullLogR2Gradient_eachComponent(0, x_tilde, X_train, Y_train);
        %fprintf('DASVRDA_ns completion porcentage = %3.2f, obj = %3.10f\n',100*s/S, obj_value(count));
      
        x = y_tilde;
        x_previous = x;
        x_tilde_previous = x_tilde;
        
        for k = 1: m
            count = count + 1;
            x_previous_previous = x_previous;
            x_previous = x;
            
            rand_idx = randi([1, data_size], [1, b]); 
            gradient = LogR2Gradient(0, rand_idx, x, X_train, Y_train);
            
            sum_each_component = zeros(data_dim, 1);
            for idx = 1: b
                sum_each_component = sum_each_component + eachComponent(:,rand_idx(idx));
            end
            sum_each_component = sum_each_component * 1.0/b;
            
            g = gradient - sum_each_component + full_gradient;
            x = prox_map(x_previous - eta*g, eta*lambda1, eta*lambda2);
            
            if(k > 1)
                S_pflug = S_pflug + 1.0*((x - x_previous)'*(x_previous - x_previous_previous))/(norm(x - x_previous)*norm(x_previous - x_previous_previous));
                %fprintf("<?,?> = %4.5f\n", ((x - x_previous)'*(y_tilde - x))/(norm(x - x_previous)*norm(y_tilde-x)));
                if (s-1)*m + k > tau + burnin 
                    fprintf("S = %4.5f, eta = %4.2f, k = %4.2f\n", S_pflug, eta, count);
                    if S_pflug < 0
                        eta = eta * 0.9;
                    elseif S_pflug > 0
                     eta = eta * 1.1;
                    end
                    S_pflug = 0;
                    tau = (s-1)*m + k;
                end
            end
            time_passes(count) = toc;
            data_passes(count) = data_passes(count-1) + 1.0*b/data_size;
            
            obj_value(count) = obj_logreg_r1r2(lambda1, lambda2, x, X_train, Y_train);
        end
        x_tilde = x;
        
    end
    w = x_tilde;
end