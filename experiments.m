n = 10:10:100;
d = 5:5:20;
epsilons = [0.1 0.01];
N = 100;
all_coeffs = cell(5, 4, 2);
%results_newton = cell(10, 5, 2);
results_bisection = cell(10, 5, 2);
for i = 1:length(n)
    for j = 1:length(d)
        e_iter = 1;
        coeffs = randn(n(i), d(j));
        for epsilon = epsilons
            if (isempty(results_bisection{i, j, e_iter}))
                all_coeffs{i, j, e_iter} = coeffs; 
                disp(strcat('n = ',num2str(n(i)),' , d = ', num2str(d(j)),' epsilon = ',num2str(epsilon)))
                %[samples, t_vals, k, l, preprocess_time, time_per_sample] = SampleParamCurve(coeffs, N, epsilon, 'newton');
                %results_newton{i, j, e_iter} = [preprocess_time, time_per_sample, min(t_vals), max(t_vals), l, k];
                
                [samples, t_vals, k, preprocess_time, time_per_sample] = SampleParamCurve(coeffs, N, epsilon, 'bisection');
                results_bisection{i, j, e_iter} = [preprocess_time, time_per_sample, min(t_vals), max(t_vals), k];
            else
                disp('skip experiment')
            end
            e_iter = e_iter + 1;
        end
        %save('results_newton_splitting_10_100.mat', 'results_newton')
        save('results_bisection_10_100.mat', 'results_bisection')
    end
    
end



