function [Cs, Ds] = compute_cheychev_approx_3(poly_decom, epsilon)

    n = length(poly_decom);
    Cs = cell(1,n);
    Ds = cell(1,n);
    
    for i = 1:n
        
        poly_speed_sq = poly_decom{i};
        k = get_chebychev_degree(poly_speed_sq, epsilon);
    
        [Cs_temp, Ds_temp] = get_cheb_coeffs(k, poly_speed_sq);
        Cs{i} = Cs_temp;
        Ds{i} = Ds_temp;
    end
    
end

