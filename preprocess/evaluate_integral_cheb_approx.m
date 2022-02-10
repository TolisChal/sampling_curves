function y = evaluate_integral_cheb_approx(Ds)

    N = length(Ds);

    y = sum(Ds.*chebyshevT((1:N),1)) - sum(Ds.*chebyshevT((1:N),-1));

end