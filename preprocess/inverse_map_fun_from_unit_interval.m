function p = inverse_map_fun_from_unit_interval(q, a, b)

    N = length(q);
    p = zeros(1, N);
    c1 = (b-a)/2;
    c2 = (b+a) / 2;
    
    %c1 = 1/c1;
    %c2 = -c2/c1;
    y = c2 / c1;
    
    for ii = 1:N
        %ii
        n = N - ii;
        ai = q(ii);
        ai = ai * c1^n;

        %n = input('n in (x+y)^n is ');   % Input desired exponent; must be Whole 
        %y = input('y in (x+y)^n is ');   % Input desired y-value
        Cy = ones(1,n+1);                 % Preallocating Cy Vector
        for j = 2:n+1                    % Calculating Cy Vector
            Cy(1,j) = y^(j-1);
        end
        %Pascals Triangle 
        Pascals_Triangle = zeros(100,100);  % Preallocating Pascals Triangle Matrix
        Pascals_Triangle(:,1) = 1;          % Setting left side to value 1 
        for i = 2:1:n+1
            for j = 2:1:n+1                 % Compute Pascals Triangle to the (n+1)th row
        
                Pascals_Triangle(i,j) = (Pascals_Triangle(i-1,j-1) + Pascals_Triangle(i-1,j));
   
            end
        end
        % Calculating Final Answer
        Cx = Pascals_Triangle(n+1,1:n+1);  % Collecting Coefficients as Vector
        pp = Cy.*Cx;
        pp = ai * pp;
        %p
        p = sum_poly_coeff(p, pp);                         % Final Coefficients obtained via

    end
    
end