function interval_decom = split_curve(Coeffs, a, b)

    n = size(Coeffs, 1);
    d = size(Coeffs, 2) - 1;
    exponents = (d:-1:1)';
    Coeffs_deriv = Coeffs(:, 1:end-1) .* repmat(exponents, [1 d]);

    exponents = ((d-1):-1:1)';
    Coeffs_sec_deriv = Coeffs_deriv(:, 1:end-1) .* repmat(exponents, [1 d-1]);
    
    poly_inner_prod_sq = inner_product_squared(Coeffs_deriv, Coeffs_sec_deriv);
    
    norm_sq_deriv = inner_product_squared(Coeffs_deriv, Coeffs_deriv);
    norm_sq_sec_deriv = inner_product_squared(Coeffs_sec_deriv, Coeffs_sec_deriv);
    
    prod_norms_sq = conv(norm_sq_deriv, norm_sq_sec_deriv);
    
    final_poly = sum_poly_coeff(poly_inner_prod_sq, -prod_norms_sq);
    r = roots(final_poly');
    
    nn = length(r);
    interval_decom = a;
    for i = 1:nn
        if (r(i) == real(r(i)))
            interval_decom = [interval_decom real(r(i))];
        end
    end
    interval_decom = [interval_decom b];
    
    
    
end


