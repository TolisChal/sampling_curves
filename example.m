%generate a curve in 3-dimensions of degree 3
coeffs = randn(3,4);

epsilon = 0.1;
N = 100;

[samples, t_vals] = SampleParamCurve(coeffs, N, epsilon);
fig = plot_points_on_3d_curve(coeffs,t_vals);
