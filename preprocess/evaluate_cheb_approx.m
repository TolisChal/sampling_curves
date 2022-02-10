function y = evaluate_cheb_approx(Cs, x)

    y = 0.5 * (eval_b(x, Cs, 0) - eval_b(x, Cs, 2));
    
end