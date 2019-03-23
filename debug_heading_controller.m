function [] = debug_heading_controller(plot_num)
global OB m n

figure(plot_num)
subplot(2,1,1)
hold on
plot(OB.TIME(m:n),OB.PSI_CMD(m:n)/pi*180);
plot(OB.TIME(m:n),OB.PSI(m:n)/pi*180);
legend('cmd','meas')
ylabel('psi[deg]')
subplot(2,1,2)
hold on
plot(OB.TIME(m:n),OB.R_REF(m:n)/pi*180);
plot(OB.TIME(m:n),OB.R_MAX(m:n)/pi*180);
legend('ref','max')
ylabel('r [deg/s]')

end