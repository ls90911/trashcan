function map_square_area_with_distance(plot_num)
global OB

figure(plot_num)
plot(OB.GATE_AREA_LOCAL,OB.DETEC_X_LOCAL_OT,'.');
xlabel('gate_area');
ylabel('detection x with OT [m]')
grid on

end