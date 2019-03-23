function [] = plot_command(plot_num)
global OB m n

figure(plot_num)
subplot(3,1,1)
plot(OB.TIME(m:n),OB.PHI_CMD(m:n)/pi*180)
hold on
plot(OB.TIME(m:n),OB.PHI(m:n)/pi*180)
ylabel('phi[deg]')

hold on
subplot(3,1,2)
plot(OB.TIME(m:n),OB.THETA_CMD(m:n)/pi*180)
hold on
plot(OB.TIME(m:n),OB.THETA(m:n)/pi*180)
ylabel('theta[deg]')
subplot(3,1,3)
plot(OB.TIME(m:n),OB.PSI_CMD(m:n)/pi*180)
ylabel('psi[deg]')
xlabel('t [s]')

end