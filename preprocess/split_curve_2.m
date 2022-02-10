function interval_decom = split_curve_2(Coeffs, a, b)

    n = size(Coeffs, 1);
    d = size(Coeffs, 2) - 1;
    
    Coeffs_deriv = zeros(n, d);
    Coeffs_sec_deriv = zeros(n, d-1);
    for i=1:n
        Coeffs_deriv(i, :) = polyder(Coeffs(i,:));
        Coeffs_sec_deriv(i, :) = polyder(Coeffs_deriv(i,:));
    end
    
    norm_sq_deriv = inner_product_squared(Coeffs_deriv, Coeffs_deriv, false);    
    inner_prod_deriv = inner_product_squared(Coeffs_deriv, Coeffs_sec_deriv, false);
    
    prod_1 = zeros(n, length(Coeffs_sec_deriv(1, :)) - 1 + length(norm_sq_deriv) - 1 + 1);
    prod_2 = zeros(n, length(Coeffs_deriv(1, :)) - 1 + length(inner_prod_deriv) - 1 + 1);
    
    for i = 1:n
        prod_1(i, :) = conv(Coeffs_sec_deriv(i, :), norm_sq_deriv);
        prod_2(i, :) = conv(Coeffs_deriv(i, :), inner_prod_deriv);
    end
    
    fun = @(x)sytemEqns(x, prod_1, prod_2);
    x0 = (a+b)/2;
    
    options = optimoptions('fsolve','Display','off','Algorithm','levenberg-marquardt');
    [sol, fval, exitflag] = fsolve(fun, x0, options);
    %exitflag
    if ((exitflag > 0) && (abs(sol) < 1))
        fval
        Coeffs
        error('we have to split')
        all_roots = {};
        for i = 1:n
            p = sum_poly_coeff(prod_1(i, :), -prod_2(i, :));
            r = roots(p);
            nn = length(r);
            %interval_decom = a;
            iter_roots = [];
            for j = 1:nn
                if (r(j) == real(r(j)))
                    if ((real(r(j)) < b) && (real(r(j)) > a))
                        iter_roots = [iter_roots real(r(j))];
                    end
                end
            end
            iter_roots = unique(iter_roots);
            all_roots{i} = iter_roots;
        end
    else
        interval_decom = [a b];
        return
    end
    tol = 1e-03;
    have_roots = false;
    interval_decom = [a b];
    final_roots = [];
    for i= 1:1
        r1 = all_roots{i};
        
        if (isempty(r1))
            interval_decom = [a b];
            return
        end
        
        for j = 2:2
            r2 = all_roots{j};
            
            if (isempty(r2))
                interval_decom = [a b];
                return
            end
            
            for k1 = r1
                for k2 = r2
                    if ((abs(k1-k2) / min(abs(k1), abs(k2))) < tol)
                        iscommon = true;
                        for k = 3:n
                            rk = all_roots{k};
                            for kk = rk
                                if (~((abs(k1-kk) / min(abs(k1), abs(kk))) < tol))
                                    iscommon = false;
                                    break
                                end
                            end
                            if (~iscommon)
                                break
                            end
                        end
                        if (iscommon)
                            final_roots = [final_roots k1];
                            have_roots = true;
                        end
                    end
                end
            end
        end
    end
    
    if (have_roots)
        final_roots = unique(final_roots);
        interval_decom = [a final_roots b];
        interval_decom = sort(interval_decom);
    end
    
end
    %inner_prod_sq = inner_product_squared(prod_1, prod_2, true);
    %norm_sq_prod_1 = inner_product_squared(prod_1, prod_1, false);
    %norm_sq_prod_2 = inner_product_squared(prod_2, prod_2, false);
    
    %poly_final = sum_poly_coeff(inner_prod_sq, -conv(norm_sq_prod_1, norm_sq_prod_2));
    
    %poly_prod = inner_product_squared(prod_1, prod_2, false);
    %poly_prod(end) = poly_prod(end) - 1;
    %r = roots(poly_final')
    
    %nn = length(r);
    %interval_decom = a;
    %for i = 1:nn
    %    if (r(i) == real(r(i)))
    %        interval_decom = [interval_decom real(r(i))];
    %    end
    %end
    %interval_decom = [interval_decom b];
    %interval_decom = sort(interval_decom);
    
    
%end


