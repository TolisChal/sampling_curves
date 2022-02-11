function k = get_chebychev_degree(poly_speed_sq, epsilon)

    r = roots(poly_speed_sq);
    nn = length(r);
    rho = Inf;
    
    for i = 1:nn
        z = r(i);
        if (abs(real(z)) > 1)
            z = complex(1, imag(z));
        %    continue
        end
        az = norm(z+1) + norm(z-1);
        %az^2
        rz = (az + sqrt(az^2-4))/2;
        if (rz < rho)
            rho = rz;
        end
    end
    %rho
    M = get_M(poly_speed_sq, rho);

    k = ceil(-log((epsilon*(rho-1)) / (2*M)) / log(rho));
end

