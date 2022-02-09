%generate a curve in 3-dimensions of degree 3
coeffs = randn(3,4);

a = -1;
b = 1;

N = 1000;

[samples, t_vals] = SampleParamCurve(coeffs, a, b, N);
fig = plot_points_on_3d_curve(coeffs,t_vals);
