function t_val = sample_from_sq_root_poly_3(inner_prod_derivs, intervals, integral_values, integral_ratios, Cs, Ds, method)

    ws = cumsum(integral_ratios);
    wi = rand;
    
    pos = find(wi < ws);
    pos = pos(1);

    uu = rand;
    u = uu * integral_values(pos);
    
    a = intervals(pos);
    b = intervals(pos+1);
    c = 2 / (b-a);
    if (strcmp(method, 'newton'))
        rt = newton(Ds{pos}, Cs{pos}, u, c, inner_prod_derivs, a, b);
    elseif (strcmp(method, 'bisection'))
        rt = bisection(Ds{pos}, u, c);
    else
        error('unknown method')
    end
    
    
    tol = 1e-02;
    
    if (rt > b && (abs(rt-b)/min(abs(rt), abs(b))<tol))
        %rt
        t_val = b;
    elseif(rt < a && (abs(rt-a)/min(abs(rt), abs(a))<tol))
        %abs(rt-b)/min(abs(rt),abs(b))
        %rt
        t_val = a;
    else
        t_val = rt;
    end
    
    t_val = (t_val*(b-a) + b + a) / 2;
    
end

