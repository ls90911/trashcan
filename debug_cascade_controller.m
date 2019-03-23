function [] = debug_cascade_controller(plot_num)
global OB m n

figure(plot_num)
subplot(2,1,1)
hold on
plot(OB.TIME(m:n),OB.VX_CMD(m:n));
plot(OB.TIME(m:n),OB.VX_FILTERED(m:n));
plot(OB.TIME(m:n),OB.VX_OT(m:n));
legend('cmd','filtered','OT')
ylabel('v_x [m/s]')

hold on
subplot(2,1,2)
hold on
plot(OB.TIME(m:n),OB.VY_CMD(m:n));
plot(OB.TIME(m:n),OB.VY_FILTERED(m:n));
plot(OB.TIME(m:n),OB.VY_OT(m:n));
ylabel('v_y [m/s]')
xlabel('t [s]')

end