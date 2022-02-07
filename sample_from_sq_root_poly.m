function t_val = sample_from_sq_root_poly(poly_speed_sq, intervals, integral_values, integral_ratios, chebyshev_polynomials)

    n = length(integral_values);
    
    ws = cumsum(integral_ratios);
    wi = rand;
    
    pos = find(wi < ws);
    pos = pos(1);

    u = rand * integral_values(pos);
    f_deriv = chebyshev_polynomials(pos, :);
    f = polyint(f_deriv);
    
    a = intervals(pos);
    b = intervals(pos+1);
    
    f(end) = f(end) - u;
    r = roots(f);
    
    nn = length(r);
    
    for i=1:nn
        if (r(i) == real(r(i)))
            if ((r(i) < b) && (r(i) > a))
                t_val = real(r(i));
                return
            end
        end
    end
    
end

