function t_val = sample_from_sq_root_poly(poly_speed_sq, intervals, integral_values, chebyshev_polynomials)

    n = length(integral_values);
    
    ws = cumsum(integral_values);
    wi = rand;
    
    pos = find(wi < ws);
    pos = pos(1);

    u = rand * integral_values(pos);
    f_deriv = chebyshev_polynomials(pos, :);
    f = polyint(f_deriv);
    
    a = intervals(pos);
    b = intervals(pos+1);
    
end

