function [] = debug_indi_outloop_controller(plot_num)
global OB m n

figure(plot_num)
subplot(2,1,1)
hold on
plot(OB.TIME(m:n),OB.VX_OT(m:n));
plot(OB.TIME(m:n),OB.VX_CMD(m:n));
plot(OB.TIME(m:n),OB.VX_FILTERED(m:n));
ylabel('vx[m/s]')
legend('OT','cmd','filtered')

subplot(2,1,2)
hold on
plot(OB.TIME(m:n),OB.VY_OT(m:n));
plot(OB.TIME(m:n),OB.VY_CMD(m:n));
plot(OB.TIME(m:n),OB.VY_FILTERED(m:n));
ylabel('vy[m/s]')
xlabel('time[s]')
end