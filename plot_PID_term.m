function [] = plot_PID_term(plot_num)
global OB m n

figure(plot_num)
subplot(2,1,1)
hold on
plot(OB.TIME(m:n),OB.P_TERM_X(m:n)/pi*180);
plot(OB.TIME(m:n),OB.D_TERM_X(m:n)/pi*180);
legend('P','D')
ylabel('PD term x [deg]')

hold on
subplot(2,1,2)
hold on
plot(OB.TIME(m:n),OB.P_TERM_Y(m:n)/pi*180);
plot(OB.TIME(m:n),OB.D_TERM_Y(m:n)/pi*180);
ylabel('PD term y [deg]')
legend('P','D')
xlabel('t [s]')

end