%generate a curve in 3-dimensions of degree 3
coeffs = randn(3,4);

epsilon = 0.1;
N = 10;

a = -1;
b = 1;

[samples, t_vals, k, preprocess_time, time_per_sample] = SampleParamCurve(coeffs, a, b, N, epsilon);
fig = plot_points_on_3d_curve(coeffs,t_vals);

X = rand(1, 15000);
X = a*X + b*(1-X);

Y = evaluate_curve(coeffs, X);

scatter3(Y(1,:),Y(2,:),Y(3,:),25,Y(3,:),'.')
hold on

scatter3(samples(1,1:10),samples(2,1:10),samples(3,1:10),450,'r.')
set(gca,'xticklabel',num2str(''))
set(gca,'yticklabel',num2str(''))
set(gca,'zticklabel',num2str(''))