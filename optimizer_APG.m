function [obj_value, w] = optimizer_APG(X, Y, w, lambda1, lambda2, max_iter, epsilon)

    w_prev = w;
    y = w;
    t_prev = 1;
    tic;
    
    gradient = prox_map(FullLogR2Gradient(0, w, X, Y), lambda1, lambda2);
    abs_grad = norm(gradient);
    
    t = 1;
    while (t <= max_iter) && (abs_grad > epsilon)

        w = prox_map(y - 4.0*FullLogR2Gradient(0, y, X, Y), 4.0*lambda1, 4.0*lambda2);
        abs_grad = norm(w - w_prev);
        t_curr = 0.5*(1 + sqrt(1 + 4*t_prev*t_prev));
        y = w + 1.0*(t_prev - 1)/t_curr * (w - w_prev);
        w_prev = w;
        
        if(rem(t,floor(0.01*max_iter)) == 0)
            fprintf('total #iteration = %d (%3.2f)\n',t, log(abs_grad)/log(10));
        end
        
        t_prev = t_curr;
        t = t + 1;
    end

    t2 = toc;
    obj_value = obj_logreg_r1r2(lambda1, lambda2, w, X, Y);
    fprintf('total #iteration = %d (%3.2f s)\n',t, t2);
end
