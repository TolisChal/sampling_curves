function x = bisection(Ds, u, c)

    N = length(Ds);
    
    x_prev = 10;
    a = -1;
    b = 1;
    x = (a+b)/2;
    tol = 1e-08;
    
    u = u + sum(Ds.*chebyshevT(1:N,-1)) / c;
    %abs(x-x_prev) / min(abs(x), abs(x_prev))
    while (abs(x-x_prev) / min(abs(x), abs(x_prev)) > tol)
        
        
        x_prev = x;
        
        val = sum(Ds.*chebyshevT(1:N, x)) / c -u;% ) / evaluate_cheb_approx(Cs, x) );
        if (val > 0)
            b = x;
        else
            a = x;
        end
        x = (a+b)/2;
    end


end
