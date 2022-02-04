function poly_speed_sq = get_squred_speed(Coeffs)
    
    n = size(Coeffs, 1);
    d = size(Coeffs, 2) - 1;
    exponents = (d:-1:1)';
    Coeffs_deriv = Coeffs(:, 1:end-1) .* repmat(exponents, [1 d]);
    
    d = size(Coeffs_deriv, 2) - 1;

    degrees = d:-1:0;
    
    poly_speed_sq = zeros(n, 2*d + 1);
    
    for dim = 1:n
        for i = degrees
            for j = i:-1:0
                it_degree = i+j;
                poly_speed_sq(it_degree + 1) = poly_speed_sq(it_degree + 1) + Coeffs_deriv(dim, i) * Coeffs_deriv(dim, j);
            end
        end
    end


end