function [integral_values, integral_ratios] = estimate_integrals_mc(interval_decom, poly_speed_sq)

    n = length(interval_decom);
    integral_values = zeros(1, n-1);
    
    for i = 1:(n-1)
        a = interval_decom(i);
        b = interval_decom(i+1);
        
        X = rand(1, 5000);
        vals = sqrt(spolyval(poly_speed_sq, X));
        integral_values(i) = mean(vals);
    end
    
    integral_ratios = integral_values / sum(integral_values);

end

