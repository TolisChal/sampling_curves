function y = compute_interval_weight(Cs)

    N = length(Cs);
    
    s = 0;
    for i = 3:N
        s = s + ( (1 + (-1)^(i-1)) / ((i-1)^2 - 1) ) * Cs(i); 
    end
    y = Cs(1) - s;
    
end