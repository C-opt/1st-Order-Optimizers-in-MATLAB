function  [all_S_pflug, all_eta, time_passes, obj_value, w] = SVRG_adapRestart_pflug_sc(X_train, Y_train, x_tilde, omega, L, m, b, S, eta, lambda1, lambda2, innerPt_no)

    [data_dim, data_size] = size(X_train);

    innerPt_no = min(floor(sqrt(m)), innerPt_no);
    
    obj_value = zeros(S*(1 + innerPt_no) + 1, 1);
    all_S_pflug = zeros(S, 1);
    all_eta = zeros(S,1);
    time_passes = zeros(S*(1 + innerPt_no) + 1, 1);
    
    count = 1;
    obj_value(count) = obj_logreg_r1r2(lambda1, lambda2, x_tilde, X_train, Y_train);
    
    burnin = floor(m-1);
    
    tic
    for s = 1: S
        S_pflug = 0;
        count = count + 1;
        obj_value(count) = obj_value(count-1);
        
        time_passes(count) = toc;
        [full_gradient, eachComponent] = FullLogR2Gradient_eachComponent(0, x_tilde, X_train, Y_train);
      
        tau = 0;
        x = x_tilde;
        x_previous = x_tilde;
        x_previous_previous = x_previous;
        
        for k = 1: m
            rand_idx = randi([1, data_size], [1, b]); 
            gradient = LogR2Gradient(0, rand_idx, x, X_train, Y_train);
            
            sum_each_component = sum(eachComponent(:,rand_idx),2) * 1.0/b;
            
            x_previous_previous = x_previous;
            x_previous = x;
            
            g = gradient - sum_each_component + full_gradient;
            x = prox_map(x - eta*g, eta*lambda1, eta*lambda2);
            
             if(k > 1)                 
                term1 = ((x_previous - x_previous_previous)'*(x - x_previous))/(norm(x - x_previous)*norm(x_previous - x_previous_previous));
                %term2 = ((z_previous - z_previous_previous)'*(z - z_previous))/(norm(z - z_previous)*norm(z_previous - z_previous_previous));
                S_pflug = S_pflug + 1.0 * term1;
                %S_pflug = S_pflug + 1.0*((g_previous - g_previous_previous)'*(g - g_previous))/(norm(g_previous - g_previous_previous)*norm(g - g_previous));
             end
             
             if(k > tau + burnin)
                S_pflug = S_pflug/k;
                all_S_pflug(s) = S_pflug;
                all_eta(s) = eta;
                UB = 0.80;
                LB = 0.10;

                if S_pflug < LB
                    eta = eta*0.95;
                elseif S_pflug > UB
                    eta = eta*1.05;
                end
                S_pflug = 0;
                tau = k;
             end
             
              if rem(k, ceil(m/(innerPt_no + 1)) ) == 0 && k ~= m
                count = count + 1;
                time_passes(count) = toc;
                obj_value(count) = obj_logreg_r1r2(lambda1, lambda2, x, X_train, Y_train);
             end
        end
        x_tilde = x;
    end
    w = x_tilde;
end
