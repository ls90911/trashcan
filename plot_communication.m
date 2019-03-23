function [] = plot_communication(plot_num)
global OB m n

figure(plot_num)
subplot(3,1,1)
plot(OB.TIME,OB.AX)
ylabel('ax');
subplot(3,1,2)
plot(OB.TIME,OB.AY)
ylabel('ax');
subplot(3,1,3)
plot(OB.TIME,OB.AZ)
ylabel('az');
xlabel('time[s]')

end