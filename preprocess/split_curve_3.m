function [interval_decom, inner_prod_deriv] = split_curve_3(Coeffs, a, b, method)
    
    
    
    n = size(Coeffs, 1);
    d = size(Coeffs, 2) - 1;
    
    Coeffs_deriv = zeros(n, d);
    Coeffs_sec_deriv = zeros(n, d-1);
    for i=1:n
        Coeffs_deriv(i, :) = polyder(Coeffs(i,:));
        Coeffs_sec_deriv(i, :) = polyder(Coeffs_deriv(i,:));
    end
    
    norm_sq_deriv = inner_product_squared(Coeffs_deriv, Coeffs_deriv, false);    
    inner_prod_deriv = inner_product_squared(Coeffs_deriv, Coeffs_sec_deriv, false);
    
    if (strcmp(method, 'bisection'))
        interval_decom = [a b];
        return
    end
    
    r1 = roots(norm_sq_deriv);
    nn1 = length(r1);
    for i=1:nn1
        if (r1(i) == real(r1(i)))
            error('speed has zeros in [a,b]')
        end
    end
    
    r2 = roots(inner_prod_deriv);
    nn2 = length(r2);
    
    interval_decom = [a b];
    
    for i=1:nn2
        if (r2(i) == real(r2(i)))
            interval_decom = [interval_decom real(r2(i))];
        end
    end
    interval_decom = sort(interval_decom);
    
end

