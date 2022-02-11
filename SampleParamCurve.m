function [samples, t_vals, k, preprocess_time, time_per_sample] = SampleParamCurve(coeffs, a, b, N, epsilon, method)
    % This is the main function to sample of an n-dimensional polynomial parametric curve of degree d 
    % Inputs:
    % i) coeffs: a nxd matrix that contains rowwsie the coefficients of polynomials
    % of each dimension
    % ii) The curve [a, b] -> R^n 
    % iii) Number of uniformly distributed points to generate
    % iv) The error of Chebychev approximation
    % v) 

    if (nargin == 4)
        epsilon = 0.01;
        method = 'bisection';
    elseif (nargin == 5)
        method = 'bisection';
    end
    
    n = size(coeffs, 1);
    
    
    poly_speed_sq = get_squred_speed(coeffs);
    
    tic
    [inner_prod_derivs, intervals, integral_values, integral_ratios, Cs, Ds] = preprocess_sq_root_speed_2(coeffs, poly_speed_sq, a, b, epsilon, method);
    preprocess_time = toc;
    l = length(Cs);
    k = zeros(1, l);
    for i = 1:l
        k(i) = length(Cs{i}) - 1;
    end
    
    sample = zeros(n,1);
    samples = zeros(n, N);
    t_vals = zeros(1, N);
    
    tic
    for i=1:N
        %i
        t_val = sample_from_sq_root_poly_3(inner_prod_derivs, intervals, integral_values, integral_ratios, Cs, Ds, method);
        t_vals(i) = t_val;
        for j = 1:n
            sample(j) = polyval(coeffs(j, :), t_val);
        end
        samples(:, i) = sample;
    end
    time_per_sample = toc;
    time_per_sample = time_per_sample / N;

end

