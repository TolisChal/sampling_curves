function poly_coeffs = inner_product_squared(coeffs1, coeffs2, squared)

    n = size(coeffs1, 1);
    
    if (size(coeffs2, 1) ~= n)
        error('error in inner product')
    end
    
    poly_coeffs = conv(coeffs1(1, :), coeffs2(1, :));
    for i = 2:n
        poly_coeffs = sum_poly_coeff(poly_coeffs, conv(coeffs1(i, :), coeffs2(i, :)));
    end
    
    if (squared)
        poly_coeffs = conv(poly_coeffs, poly_coeffs);
    end

end

