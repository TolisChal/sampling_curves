function z0 = get_initial_point(rho)
    
    syms Z
    eqn = norm(Z + sqrt(Z^2-1))==rho;
    z = double(vpasolve(eqn));
    
    z0 = [real(z) imag(z) rho];
end

