function [Cs, Ds] = get_cheb_coeffs(k, poly_speed_sq)
    
    d = pi/(2*k+2);
    for jj=1:k+1
        CP(jj) = cos((2*jj-1)*d);
    end
    %CP = sort(CP);
    %chebyshevT(k+1,CP)
    %[Cs,~,~] = cheby(poly_speed_sq,k,-1,1);
    
    Cs = zeros(1, k+1);

    for i = 0:k
        Cs(i+1) = sum(sqrt(polyval(poly_speed_sq, CP)).*chebyshevT(i,CP)) * (2/(k+1));
    end
    
    Ds = zeros(1, k+1);
    
    for i = 1:(k-1)
        Ds(i) = (Cs(i) - Cs(i+2)) / (2*i);
    end
    Ds(k) = Cs(k) / (2*k);
    Ds(k+1) = Cs(k+1) / (2*(k+1));

end

