function [] = calibrate_camera(plot_num)

global OB

local_detection_error_x = zeros(length(OB.DETEC_TIME_LOCAL),1);
local_detection_error_y = zeros(length(OB.DETEC_TIME_LOCAL),1);

for i = 1:length(OB.DETEC_TIME_LOCAL)
    if OB.DETEC_X_LOCAL_OT(i) > -1 || OB.DETEC_Y_LOCAL_OT(i) < -2
        local_detection_error_x(i) =  0;
        local_detection_error_y(i) =  0;
    else
        local_detection_error_x(i) =  OB.DETEC_X_LOCAL_OT(i) - OB.DETEC_X_LOCAL(i);
        local_detection_error_y(i) =  OB.DETEC_Y_LOCAL_OT(i) - OB.DETEC_Y_LOCAL(i);
    end
    
end

 p_x = polyfit(OB.DETEC_X_LOCAL',local_detection_error_x,1);
 fitted_x = polyval(p_x,OB.DETEC_X_LOCAL);
 p_y = polyfit(OB.DETEC_Y_LOCAL',local_detection_error_y,2);
 fitted_y = polyval(p_y,OB.DETEC_Y_LOCAL);

% X = [ones(length(OB.DETEC_TIME_LOCAL),1) OB.DETEC_X_LOCAL' OB.DETEC_Y_LOCAL' OB.DETEC_X_LOCAL'.*OB.DETEC_Y_LOCAL'];
% Y = [ones(length(OB.DETEC_TIME_LOCAL),1) OB.DETEC_X_LOCAL' OB.DETEC_Y_LOCAL'];
% %p_x = regress(local_detection_error_x,X);
% p_y = regress(local_detection_error_y,Y);
% compensate detection with model error
compensate_x = zeros(length(OB.DETEC_TIME_LOCAL),1);
compensate_y = zeros(length(OB.DETEC_TIME_LOCAL),1);


for i = 1:length(OB.DETEC_TIME_LOCAL)
%     compensate_x(i) = OB.DETEC_X_LOCAL(i) + (OB.DETEC_X_LOCAL(i)^2*p_x(1)+p_x(2)*OB.DETEC_X_LOCAL(i)+p_x(3));
%     compensate_y(i) = OB.DETEC_Y_LOCAL(i) + (OB.DETEC_X_LOCAL(i)*p_y(1)+p_y(2));

     compensate_x(i) = OB.DETEC_X_LOCAL(i) + p_x(1)+p_x(2)*OB.DETEC_X_LOCAL(i);
    compensate_y(i) = OB.DETEC_Y_LOCAL(i) +(OB.DETEC_Y_LOCAL(i)^2*p_y(1)+p_y(2)*OB.DETEC_Y_LOCAL(i)+p_y(3));
end

figure(plot_num)
subplot(4,1,1)
hold on
plot(OB.DETEC_X_LOCAL,local_detection_error_x,'.');
plot(OB.DETEC_X_LOCAL,fitted_x);
legend('detection error','fitted model');
xlabel('detection x [m]');
ylabel('detection error x [m]');

subplot(4,1,2)
hold on
plot(OB.DETEC_X_LOCAL,local_detection_error_y,'.');
plot(OB.DETEC_X_LOCAL,fitted_y);
legend('detection error','fitted model');
xlabel('detection x [m]');
ylabel('detection error y [m]');

subplot(4,1,3)
hold on
plot(OB.DETEC_TIME_LOCAL,OB.DETEC_X_LOCAL,'*');
plot(OB.DETEC_TIME_LOCAL,OB.DETEC_X_LOCAL_OT);
plot(OB.DETEC_TIME_LOCAL,compensate_x);
legend('detection','OT','compensated');
ylabel('x[m]');

subplot(4,1,4)
hold on
plot(OB.DETEC_TIME_LOCAL,OB.DETEC_Y_LOCAL,'*');
plot(OB.DETEC_TIME_LOCAL,OB.DETEC_Y_LOCAL_OT);
plot(OB.DETEC_TIME_LOCAL,compensate_y);
legend('detection','OT','compensated');
ylabel('y[m]');
xlabel('time [s]');

end