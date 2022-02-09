function y = obj_fun_init(z)
    
    q = complex(z(1), z(2));
    y = abs(norm(q + sqrt(q^2 - 1)) - z(3));

end