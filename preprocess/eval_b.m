function b = eval_b(x, Cs, index)
    
    N = length(Cs) - 1;
    
    if ((index == (N+1)) || (index == (N+2)))
        b = 0;
        return
    end

    b = 2.*x.*eval_b(x, Cs, index+1) - eval_b(x, Cs, index+2) + Cs(index+1);

end
