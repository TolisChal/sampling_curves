function M = get_M(poly_speed_sq, rho)

    z0 = get_initial_point(rho);
    
    nonlcon = @(z)ellipse_con(z, rho);
    fun = @(z)obj_fun(poly_speed_sq, z);
    
    options = optimoptions('fmincon','Display','off','MaxIterations', 10);
    [z,M,exitflag] = fmincon(fun,z0,[],[],[],[],[],[],nonlcon,options);
    if (exitflag > 0)
        %exitflag
        M = -M;
    else
        M = -obj_fun(poly_speed_sq, z0);
    end
end

