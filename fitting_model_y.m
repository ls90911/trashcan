function [error] = fitting_model_y(parameter_to_be_estimated)
global OB

k_y0_y = parameter_to_be_estimated(1);
k_x_y = parameter_to_be_estimated(2);
k_y_y = parameter_to_be_estimated(3);
error = 0;

for i = 1:length(OB.DETEC_ERROR_X)
    deltaX = (k_y0_y + k_x_y*OB.DETEC_X_E(i)+k_y_y*OB.DETEC_Y_E(i));
    error = error + (deltaX-OB.DETEC_ERROR_Y(i))^2;
end

end