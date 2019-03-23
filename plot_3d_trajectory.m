function [] = plot_3d_trajectory(plot_num)
global OB m n

figure(plot_num)
hold on
plot(OB.X_OT,OB.Y_OT);
plot(OB.FILTERED_X,OB.FILTERED_Y);
plot(OB.DETEC_X_E,OB.DETEC_Y_E,'.');
legend('OT','filtered','detection')
xlabel('x[m]');
ylabel('y[m]');