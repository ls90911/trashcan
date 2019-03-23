function [] = debug_ransac_vel(plot_num)
global OB m n

figure(plot_num)
subplot(2,1,1)
hold on
plot(OB.TIME(m:n),smooth(OB.VX_OT(m:n),20));
plot(OB.TIME(m:n),OB.VX_FILTERED(m:n));
plot(OB.TIME(m:n),OB.PRE_VX(m:n));
xlabel('vx [m/s]')
legend('OT','filtered','prediction')
grid on
subplot(2,1,2)
hold on
plot(OB.TIME(m:n),smooth(OB.VY_OT(m:n),20));
plot(OB.TIME(m:n),OB.VY_FILTERED(m:n));
plot(OB.TIME(m:n),OB.PRE_VY(m:n));
xlabel('vy [m/s]')
grid on

