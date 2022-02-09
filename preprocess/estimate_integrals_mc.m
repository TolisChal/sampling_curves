function [integral_values, integral_ratios] = estimate_integrals_mc(interval_decom, cheb_coeffs)

    n = length(interval_decom);
    integral_values = zeros(1, n-1);
    
    for i = 1:(n-1)
        a = interval_decom(i);
        b = interval_decom(i+1);
        
        X = rand(1, 5000);
        X = a*X + b*(1-X);
        
        vals = polyval(cheb_coeffs(i,:), X);
        integral_values(i) = mean(vals)*(b-a);
    end
    
    integral_ratios = integral_values / sum(integral_values);

end

