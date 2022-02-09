function Y = evaluate_curve(coeffs, X)

    N = length(X);
    n = size(coeffs, 1);
    Y = zeros(n, N);
    
    for j = 1:n
        Y(j, :) = polyval(coeffs(j, :), X);
    end

end