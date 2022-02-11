function [inner_prod_derivs, interval_decom, integral_values, integral_ratios, Cs, Ds] = preprocess_sq_root_speed_2(Coeffs, poly_speed_sq, a, b, epsilon, method)
    
    %interval_decom = split_curve_2(Coeffs, a, b);
    [interval_decom, inner_prod_derivs] = split_curve_3(Coeffs, a, b, method);
    
    %chebyshev_coeffs = compute_cheychev_approx(poly_speed_sq, interval_decom, epsilon);
    poly_decom = get_polynomial_in_each_interval(poly_speed_sq, interval_decom);
    [Cs, Ds] = compute_cheychev_approx_3(poly_decom, epsilon);
    %[Cs, Ds] = compute_cheychev_approx_2(poly_speed_sq, interval_decom, epsilon);
    
    %[integral_values, integral_ratios] = estimate_integrals_mc(interval_decom, chebyshev_coeffs);
    %[integral_values, integral_ratios] = estimate_integrals_2(interval_decom, Ds);
    [integral_values, integral_ratios] = estimate_integrals_3(interval_decom, Ds);
    
end

