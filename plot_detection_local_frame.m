function [] = plot_detection_local_frame(figure_id)
global OB

figure(figure_id)
subplot(3,1,1)
title('detection in local frame');
plot(OB.DETEC_TIME_LOCAL,OB.DETEC_X_LOCAL,'*');
ylabel('x[m]')
hold on
subplot(3,1,2)
plot(OB.DETEC_TIME_LOCAL,OB.DETEC_Y_LOCAL,'*');
ylabel('y[m]')
hold on
subplot(3,1,3)
plot(OB.DETEC_TIME_LOCAL,OB.DETEC_Z_LOCAL,'*');
ylabel('z[m]')
hold on

end