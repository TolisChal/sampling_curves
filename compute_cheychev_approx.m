function chebyshev_coeffs = compute_cheychev_approx(poly_speed_sq, interval_decom)

    n = length(interval_decom);
    k = 10;
    for k=1:n+1
        CP(k) = cos((2*k-1)*d);
    end
    
    chebyshev_coeffs = zeros(n-1, k);
    
    for i = 1:(n-1)
        a = interval_decom(i);
        b = interval_decom(i+1);
        
        X = (b-a)*CP/2+(a+b)/2;
        Y = sqrt(polyval(poly_speed_sq, X));
        p = polyfit(X, Y, k-1);
        chebyshev_coeffs(i, :) = p;
    end

end
