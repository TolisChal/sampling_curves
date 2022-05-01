function X = MetropolisHastings(x, f, a, b, W, N)

    L = (b - a) / 6;
    X = [];
    fx = sqrt(polyval(f, x));
    
    for i=1:N
        for j=1:W

            dx = rand*L;
            u = rand;
            if (u>0)
                y = x + dx;
            else
                y = x - dx;
            end
            if (x > b || x < a)
                fy = 0;
            else
                fy = sqrt(polyval(f, y));
            end
            if (rand < fy/fx)
                x = y;
                fx = fy;
            end
            
        end
        for j = 1:n
            sample(j) = polyval(coeffs(j, :), t_val);
        end
        samples(:, i) = sample;
        X = [X x];
    end
end

