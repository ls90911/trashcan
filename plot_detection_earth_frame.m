function [] = plot_detection_earth_frame(figure_id)
global OB

% figure(figure_id)
% plot(OB.DETEC_X_E,OB.DETEC_Y_E,'*');
% xlabel('x[m]')
% ylabel('y[m]')
% grid on;
% hold on;
% title('detection in earch frame');

figure(figure_id)
subplot(2,1,1)
plot(OB.DETEC_TIME_E,OB.DETEC_X_E,'*');
ylabel('x[m]');
subplot(2,1,2)
plot(OB.DETEC_TIME_E,OB.DETEC_Y_E,'*');
ylabel('y[m]');
end