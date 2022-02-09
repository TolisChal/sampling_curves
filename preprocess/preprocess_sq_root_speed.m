function [interval_decom, integral_values, integral_ratios, chebyshev_coeffs] = preprocess_sq_root_speed(Coeffs, poly_speed_sq, a, b)
    
    interval_decom = split_curve_2(Coeffs, a, b);
    
    chebyshev_coeffs = compute_cheychev_approx(poly_speed_sq, interval_decom);
    
    [integral_values, integral_ratios] = estimate_integrals_mc(interval_decom, chebyshev_coeffs);
    
end

