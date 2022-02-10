function y = eval_cheb(Cs, x)
    
    N = length(Cs) - 1;
    y = Cs(1)/2 + sum(Cs(2:end).*chebyshevT(1:N,x));


end

