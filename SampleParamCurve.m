function [samples] = SampleParamCurve(Coeffs, N)
    
    n = size(Coeffs, 1);
    
    poly_speed_sq = get_squred_speed(Coeffs);
    
    [intervals, integral_values, integral_ratios, chebyshev_polynomials] = preprocess_sq_root_speed(poly_speed_sq);
    
    sample = zeros(n,1);
    samples = zeros(n, N);
    
    for i=1:N
        t_val = sample_from_sq_root_poly(poly_speed_sq, intervals, integral_values, integral_ratios, chebyshev_polynomials);
        for j = 1:n
            sample(j) = polyval(Coeffs(j, :), t_val);
        end
        samples(:, i) = sample;
    end

end

