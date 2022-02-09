function F = sytemEqns(x, prod_1, prod_2)

    n = size(prod_1, 1);
    F = zeros(n, 1);
    
    for j = 1:n
        F(j) = polyval(prod_1(j, :), x) - polyval(prod_2(j, :), x);
    end

end

