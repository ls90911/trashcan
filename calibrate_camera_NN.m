function [] = calibrate_camera_NN(plot_num)

global OB

figure(plot_num)
plot(OB.DETEC_X_LOCAL_OT,OB.GATE_AREA_LOCAL)

end