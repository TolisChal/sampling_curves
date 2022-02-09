function fig = plot_points_on_3d_curve(Coeffs, X)

    Y = evaluate_curve(Coeffs, X);
    fig = plot3(Y(1,:),Y(2,:), Y(3,:), '.');


end

