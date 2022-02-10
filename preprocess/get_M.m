function M = get_M(poly_speed_sq, rho)

    z0 = get_initial_point(rho);
    
    nonlcon = @(z)ellipse_con(z, rho);
    fun = @(z)obj_fun(poly_speed_sq, z);
    
    options = optimoptions('fmincon','Display','off');
    [z,M,exitflag] = fmincon(fun,z0,[],[],[],[],[],[],nonlcon,options);
    M = -M;
end

