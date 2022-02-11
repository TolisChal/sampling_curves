function poly_decom = get_polynomial_in_each_interval(poly_speed_sq, interval_decom)

    n = length(interval_decom);
    poly_decom = cell(1, n-1);
    
    for i = 1:(n-1)
        a = interval_decom(i);
        b = interval_decom(i+1);
        poly_decom{i} = inverse_map_fun_from_unit_interval(poly_speed_sq, a, b);
    end

end

