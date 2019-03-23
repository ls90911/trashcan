function [error] = fitting_model_x(parameter_to_be_estimated)
global OB

k_x0_x = parameter_to_be_estimated(1);
k_x_x = parameter_to_be_estimated(2);
k_y_x = parameter_to_be_estimated(3);
k_x2_x = parameter_to_be_estimated(4);
k_y2_x = parameter_to_be_estimated(5);
k_xy_x = parameter_to_be_estimated(5);
error = 0;

for i = 1:length(OB.DETEC_ERROR_X)
    deltaX = (k_x0_x + k_x_x*OB.DETEC_X_E(i)+k_y_x*OB.DETEC_Y_E(i)+...
        k_x2_x*OB.DETEC_X_E(i)^2+k_y2_x*OB.DETEC_Y_E(i)^2+...
        k_xy_x*OB.DETEC_Y_E(i)*OB.DETEC_X_E(i));
    error = error + (deltaX-OB.DETEC_ERROR_X(i))^2;
end

end


