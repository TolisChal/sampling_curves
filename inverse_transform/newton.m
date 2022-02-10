function x = newton(Ds, Cs, u)

    N = length(Ds);
    
    x_prev = 0;
    x = 1;
    tol = 1e-06;
    
    u = u + sum(Ds.*chebyshevT(1:N,-1));
    %abs(x-x_prev) / min(abs(x), abs(x_prev))
    while (abs(x-x_prev) / min(abs(x), abs(x_prev)) > tol)
        
        x_prev = x;
        x = x + ( ( u - sum(Ds.*chebyshevT(1:N, x)) ) / evaluate_cheb_approx(Cs, x) );
        
    end


end
