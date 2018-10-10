function  [data_passes, time_passes, obj_value, w] = DASVRDA_adres_sc(X_train, Y_train, x_tilde, omega, L, m, b, S, lambda1, lambda2, pflug_boolean)
    

    [data_dim, data_size] = size(X_train);
    
    x_tilde_previous = zeros(data_dim, 1);
    y_tilde = zeros(data_dim, 1);
    
    obj_value = zeros(S*(1 + m) + 1, 1);
    data_passes = zeros(S*(1 + m) + 1, 1);
    time_passes = zeros(S*(1 + m) + 1, 1);
    
    count = 1;
    obj_value(count) = obj_logreg_r1r2(lambda1, lambda2, x_tilde, X_train, Y_train);
    z_tilde = x_tilde;
    x_tilde_previous = z_tilde;
    theta_tilde = 1.0 - 1.0/omega;
    L_bar = sum(L)*1.0/data_size;
    eta = 1.0/((1 + omega*(m+1)/b)*L_bar);
    eta = 4.0;
    full_gradient = zeros(data_dim,1);
    
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
        
        if((y_tilde_previous - x_tilde)'*(y_tilde - x_tilde)>0)
           theta_tilde =  1.0 - 1.0/omega;
        end
        
        time_passes(count) = toc;
        data_passes(count) = data_passes(count-1) + 1;
        
        [full_gradient, eachComponent] = FullLogR2Gradient_eachComponent(0, x_tilde, X_train, Y_train);
        %fprintf('DASVRDA_ns completion porcentage = %3.2f, obj = %3.10f\n',100*s/S, obj_value(count));
      
        x = y_tilde;
        z = y_tilde;
        g_bar = zeros(data_dim,1);
        theta = 0.5;
        x_tilde_previous = x_tilde;
        for k = 1: m
            count = count + 1;
            
            
            x_previous = x;
            z_previous = z;
            g_bar_previous = g_bar;
            theta_previous = theta;
            
            rand_idx = randi([1, data_size], [1, b]); 
            theta = theta + 0.5;
            y = (1.0 - 1.0/theta)*x_previous + 1.0/theta*z_previous;
            gradient = LogR2Gradient(0, rand_idx, y, X_train, Y_train);
            
            sum_each_component = zeros(data_dim, 1);
            for idx = 1: b
                sum_each_component = sum_each_component + eachComponent(:,rand_idx(idx));
            end
            sum_each_component = sum_each_component * 1.0/b;
            
            g = gradient - sum_each_component + full_gradient;
            g_bar = (1.0 - 1.0/theta)*g_bar_previous + 1.0/theta * g;
            z = prox_map(y_tilde - eta*theta*theta_previous*g_bar, eta*theta*theta_previous*lambda1, eta*theta*theta_previous*lambda2);
            x = (1.0 - 1.0/theta)*x_previous + 1.0/theta*z;
            
            if(pflug_boolean == 1)
                %S_pflug = S_pflug + 1.0*g_bar_previous'*g_bar;
                %S_pflug = S_pflug + 1.0*g_bar_previous'*g;
                S_pflug = S_pflug + 1.0*x_previous'*z;
                if (s-1)*m + k > tau + burnin
                    if S_pflug < 0
                        theta = 0.5;
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
        z_tilde = z;
        
    end
    w = x_tilde;
    
end