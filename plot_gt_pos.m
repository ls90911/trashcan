function [] = plot_gt_pos(plot_num)
global OB m n

figure(plot_num)
subplot(2,1,1)
hold on
plot(OB.TIME(m:n),OB.X_OT(m:n));
ylabel('x[m]')
subplot(2,1,2)
hold on
plot(OB.TIME(m:n),OB.Y_OT(m:n));
ylabel('y[m]')
xlabel('time[s]');

end