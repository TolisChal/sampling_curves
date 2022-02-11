function [c,ceq] = ellipse_con(z, rho)
    
    c = [];
    q = complex(z(1), z(2));
    z;
    ceq = [(norm(q + sqrt(q^2 - 1)) - z(3)) (z(3)-rho)];
    
end
