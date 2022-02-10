function [samples, t_vals, k, preprocess_time, time_per_sample] = SampleParamCurve(coeffs, N, epsilon)
    % This is the main function to sample of an n-dimensional polynomial parametric curve of degree d 
    % Inputs:
    % i) coeffs: a nxd matrix that contains the coefficients of polynomials
    % of each dimension
    % ii) Number of uniformly distributed points to generate
    % iii) The error of Chebychev approximation

    if (nargin == 2)
        epsilon = 0.01;
    end
    
    a = -1;
    b = 1;
    n = size(coeffs, 1);
    
    
    poly_speed_sq = get_squred_speed(coeffs);
    
    tic
    %[intervals, integral_values, integral_ratios, chebyshev_polynomials] = preprocess_sq_root_speed(coeffs, poly_speed_sq, a, b, epsilon);
    [intervals, integral_values, integral_ratios, Cs, Ds] = preprocess_sq_root_speed_2(coeffs, poly_speed_sq, a, b, epsilon);
    preprocess_time = toc;
    k = length(Cs) - 1
    
    sample = zeros(n,1);
    samples = zeros(n, N);
    t_vals = zeros(1, N);
    
    tic
    for i=1:N
        %t_val = sample_from_sq_root_poly(intervals, integral_values, integral_ratios, chebyshev_polynomials);
        t_val = sample_from_sq_root_poly_2(intervals, integral_values, integral_ratios, Cs, Ds);
        t_vals(i) = t_val;
        for j = 1:n
            sample(j) = polyval(coeffs(j, :), t_val);
        end
        samples(:, i) = sample;
    end
    time_per_sample = toc;
    time_per_sample = time_per_sample / N;

end

