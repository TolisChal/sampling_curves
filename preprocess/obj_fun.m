function y = obj_fun(poly_speed_sq, z)
    
    q = complex(z(1), z(2));
    y = -norm(sqrt(polyval(poly_speed_sq, q)));

end