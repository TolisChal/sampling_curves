function [c,ceq] = ellipse_con_in(z, rho)
    z
    q = complex(z(1), z(2));
    c = norm(q) - 10*z(3);
    
    ceq = z(3)-rho;
end
