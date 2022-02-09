function M = get_M(poly_speed_sq, rho)

    z0 = get_initial_point(rho);
    
    nonlcon = @(z)ellipse_con(z, rho);
    fun = @(z)obj_fun(poly_speed_sq, z);

    [z,M,exitflag] = fmincon(fun,z0,[],[],[],[],[],[],nonlcon);
    M = -M;
end

