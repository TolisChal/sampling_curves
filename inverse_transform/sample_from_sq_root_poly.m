function t_val = sample_from_sq_root_poly(intervals, integral_values, integral_ratios, chebyshev_polynomials)
    
    ws = cumsum(integral_ratios);
    wi = rand;
    
    pos = find(wi < ws);
    pos = pos(1);

    uu = rand;
    u= uu * integral_values(pos);
    f_deriv = chebyshev_polynomials(pos, :);
    f = polyint(f_deriv);
    
    a = intervals(pos);
    b = intervals(pos+1);
    
    f(end) = f(end) - u - polyval(f, a);
    r = roots(f);
    
    nn = length(r);
    tol = 1e-02;
    
    for i = 1:nn
        if (r(i) == real(r(i)))
            rt = real(r(i));
            
            if (real(r(i)) > b && (abs(rt-b)/min(abs(rt),abs(b))<tol))
                %abs(rt-b)/min(abs(rt),abs(b))
                %rt
                t_val = b;
            elseif(real(r(i)) < a && (abs(rt-a)/min(abs(rt),abs(a))<tol))
                %abs(rt-b)/min(abs(rt),abs(b))
                t_val = a;
            elseif (rt > a && rt <b)
                t_val = real(r(i));
            else
                continue
            end
            return
        end
    end

    
end

