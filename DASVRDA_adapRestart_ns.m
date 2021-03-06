function  [time_passes, obj_value, w] = DASVRDA_adapRestart_ns(X_train, Y_train, x_tilde, z_tilde, omega, L, m, b, S, eta, lambda1, lambda2, experiment_boolean, innerPt_no)

    [data_dim, data_size] = size(X_train);
    y_tilde = zeros(data_dim, 1);
    innerPt_no = min(floor(sqrt(m)), innerPt_no);
    
    obj_value = zeros(S*(1 + innerPt_no) +1, 1);
    time_passes = zeros(S*(1 + innerPt_no) +1, 1);
    
    count = 1;
    if experiment_boolean == 1
        obj_value(count) = obj_logreg_r1r2(lambda1, lambda2, x_tilde, X_train, Y_train);
    end
    
    x_tilde_previous = z_tilde;
    theta_tilde = 1.0 - 1.0/omega;
    
    tic
    for s = 1:S
        
        theta_tilde_previous = theta_tilde;
        theta_tilde = (1.0 - 1.0/omega)*(s+2)*0.5;
        y_tilde_previous = y_tilde;
        y_tilde = x_tilde + (theta_tilde_previous - 1)/theta_tilde * (x_tilde - x_tilde_previous) + theta_tilde_previous/theta_tilde * (z_tilde - x_tilde);
        
        [full_gradient, eachComponent] = FullLogR2Gradient_eachComponent(0, x_tilde, X_train, Y_train);
        
        count = count + 1;
        time_passes(count) = toc;
        
        if experiment_boolean == 1
            obj_value(count) = obj_value(count-1);
        end
        
        if((y_tilde_previous - x_tilde)'*(y_tilde - x_tilde) > 0)
           theta_tilde =  1.0 - 1.0/omega;
        end
        
        x = y_tilde;
        z = y_tilde;
        g_bar = zeros(data_dim,1);
        theta = 0.5;
        x_tilde_previous = x_tilde;
        for k = 1:m
            
            x_previous = x;
            z_previous = z;
            g_bar_previous = g_bar;
            theta_previous = theta;
            
            rand_idx = randi([1, data_size], [1, b]); 
            theta = 0.5*(k+1);
            y = (1.0 - 1.0/theta)*x_previous + 1.0/theta*z_previous;
            gradient = LogR2Gradient(0, rand_idx, y, X_train, Y_train);
            
            %sum_each_component = sum(eachComponent(:,rand_idx),2) * 1.0/b;
            sum_each_component = eachComponent(:,rand_idx) * ones(size(rand_idx))' * 1.0/b;
           
            
            g = gradient - sum_each_component + full_gradient;
            g_bar = (1.0 - 1.0/theta)*g_bar_previous + 1.0/theta * g;
            z = prox_map(y_tilde - eta*theta*theta_previous*g_bar, eta*theta*theta_previous*lambda1, eta*theta*theta_previous*lambda2);
            x = (1.0 - 1.0/theta)*x_previous + 1.0/theta*z;
            
            if rem(k, ceil(m/(innerPt_no + 1)) ) == 0 && k ~= m
                count = count + 1;
                time_passes(count) = toc;

                if experiment_boolean == 1
                    obj_value(count) = obj_logreg_r1r2(lambda1, lambda2, x, X_train, Y_train);
                end
            end
        end
        x_tilde = x;
        z_tilde = z;
        
    end
    w = x_tilde;
end