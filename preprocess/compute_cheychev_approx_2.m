function [Cs, Ds] = compute_cheychev_approx_2(poly_speed_sq, interval_decom, epsilon)

    n = length(interval_decom);
    k = get_chebychev_degree(poly_speed_sq, epsilon);
    %k = 10;
    
    [Cs, Ds] = get_cheb_coeffs(k, poly_speed_sq);
    
    %chebyshev_coeffs = zeros(n-1, k+1);
    
    %for i = 1:(n-1)
    %    a = interval_decom(i);
    %    b = interval_decom(i+1);
        
    %    X = (b-a)*CP/2+(a+b)/2;
    %    Y = sqrt(polyval(poly_speed_sq, X));
    %    p = polyfit(X, Y, k);
    %    chebyshev_coeffs(i, :) = p;
    %end

end

