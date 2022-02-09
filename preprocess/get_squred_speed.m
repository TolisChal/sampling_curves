function poly_speed_sq = get_squred_speed(Coeffs)
    
    n = size(Coeffs, 1);
    d = size(Coeffs, 2) - 1;
    
    Coeffs_deriv = zeros(n, d);
    
    for i=1:n
        Coeffs_deriv(i, :) = polyder(Coeffs(i,:));
    end
    
    poly_speed_sq = conv(Coeffs_deriv(1, :), Coeffs_deriv(1, :));
    for i=2:n
        poly_speed_sq = sum_poly_coeff(poly_speed_sq, conv(Coeffs_deriv(i, :), Coeffs_deriv(i, :)));
    end
    

end