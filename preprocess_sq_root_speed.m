function [interval_decom, integral_values, chebyshev_coeffs] = preprocess_sq_root_speed(Coeffs, poly_speed_sq, a, b)
    
    interval_decom = split_curve(Coeffs, a, b);
    
    integral_values = estimate_integrals_mc(interval_decom, poly_speed_sq);
    
    chebyshev_coeffs = compute_cheychev_approx(poly_speed_sq, interval_decom);
    
end

