function x = newton(Ds, Cs, u, c, inner_prod_derivs, a, b)

    N = length(Ds);
    
    x_prev = 0;
    
    if (polyval(inner_prod_derivs, (a+b)/2) > 0)
        x = 0.9999;
    else
        x = -0.9999;
    end
    
    tol = 1e-08;
    
    u = u + sum(Ds.*chebyshevT(1:N,-1)) / c;
    %abs(x-x_prev) / min(abs(x), abs(x_prev))
    while (abs(x-x_prev) / min(abs(x), abs(x_prev)) > tol)
        
        x_prev = x;
        %EvalChebyshevT(1:N, x)
        %chebyshevT(1:N, x)
        %eval_cheb(Cs, x)
        %evaluate_cheb_approx(Cs, x)
        
        x = x + ( ( u - sum(Ds.*chebyshevT(1:N, x))/c ) / (eval_cheb(Cs, x) / c) );
        
    end


end
