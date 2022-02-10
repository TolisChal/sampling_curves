function [integral_values, integral_ratios] = estimate_integrals_2(interval_decom, Ds)

    n = length(interval_decom);
    integral_values = zeros(1, n-1);
    
    for i = 1:(n-1)        
        val = evaluate_integral_cheb_approx(Ds);
        %val2 = compute_interval_weight(Cs);
        integral_values(i) = val;
    end
    %a = -1;
    %b = 1;
    %X = rand(1, 5000);
    %X = a*X + b*(1-X);
    

    %vals = evaluate_cheb_approx(Cs, X);

    %int_val = mean(vals)*2;
    
    integral_ratios = integral_values / sum(integral_values);


end
