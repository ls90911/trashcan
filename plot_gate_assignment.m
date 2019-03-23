function [] = plot_gate_assignment(plot_num)
global OB m n

figure(plot_num)
hold on
plot(OB.TIME(m:n),OB.GATE_ASSIGN(m:n),'.');
ylabel('gate nr')
xlabel('time [s]')

end