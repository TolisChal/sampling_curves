function [samples, t_vals] = SampleParamCurve(coeffs, a, b, N)
    % This is the main function
    % Inputs:
    % i) coeffs: a nxd matrix that contains the coefficients of 
    n = size(coeffs, 1);
    
    poly_speed_sq = get_squred_speed(coeffs);
    
    [intervals, integral_values, integral_ratios, chebyshev_polynomials] = preprocess_sq_root_speed(coeffs, poly_speed_sq, a, b);
    
    sample = zeros(n,1);
    samples = zeros(n, N);
    t_vals = zeros(1, N);
    
    for i=1:N
        t_val = sample_from_sq_root_poly(intervals, integral_values, integral_ratios, chebyshev_polynomials);
        t_vals(i) = t_val;
        for j = 1:n
            sample(j) = polyval(coeffs(j, :), t_val);
        end
        samples(:, i) = sample;
    end

end

