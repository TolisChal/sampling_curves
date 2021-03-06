function t_val = sample_from_sq_root_poly_2(intervals, integral_values, integral_ratios, Cs, Ds, method)

    ws = cumsum(integral_ratios);
    wi = rand;
    
    pos = find(wi < ws);
    pos = pos(1);

    uu = rand;
    u = uu * integral_values(pos);
    
    if (strcmp(method, 'newton'))
        rt = newton(Ds, Cs, u);
    elseif (strcmp(method, 'bisection'))
        rt = bisection(Ds, u);
    else
        error('unknown method')
    end
    a=-1;
    b=1;
    tol = 1e-02;
    
    if (rt > b && (abs(rt-b)/min(abs(rt), abs(b))<tol))
        rt
        t_val = b
    elseif(rt < a && (abs(rt-a)/min(abs(rt), abs(a))<tol))
        %abs(rt-b)/min(abs(rt),abs(b))
        rt
        t_val = a
    else
        t_val = rt;
    end

end

