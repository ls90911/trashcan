function [] = debug_altitude(plot_num)
global OB m n

figure(plot_num)
subplot(2,1,1)
hold on
plot(OB.TIME(m:n),OB.Z_SP(m:n));
plot(OB.TIME(m:n),OB.Z_OT(m:n));
ylabel('z[m]')
subplot(2,1,2)
plot(OB.TIME(m:n),OB.VZ_SP(m:n));
ylabel('vz[m/s]')
xlabel('t [s]')

end