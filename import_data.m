function [] = import_data(file_name)
global OB t0
%------------------------------------------
first_gate_position = [4,0];
%------------------------------------------


data = csvread(file_name,3,0);

OB.AX = data(:,2);
OB.AY = data(:,3);
OB.AZ = data(:,4);
OB.P = data(:,5);
OB.Q = data(:,6);
OB.R = data(:,7);
OB.PHI = data(:,8);
OB.THETA = data(:,9);
OB.PSI = data(:,10);
OB.POSE_X = data(:,11);
OB.POSE_Y = data(:,12);
OB.POSE_Z = data(:,13);

OB.PRE_X = data(:,14);
OB.PRE_Y = data(:,15);
OB.PRE_VX = data(:,16);
OB.PRE_VY = data(:,17);
OB.PRE_PSI = data(:,18);
OB.DETECT_X_E = data(:,19);
OB.DETECT_Y_E = data(:,20);

OB.PHI_CMD = data(:,29);
OB.THETA_CMD = data(:,30);
OB.PSI_CMD = data(:,31);
OB.ALT_CMD = data(:,32);

OB.GATE_NUM = data(:,36);
OB.FILTERED_X = data(:,37);
OB.FILTERED_Y = data(:,38);

OB.X_OT = data(:,39);
OB.Y_OT = data(:,40);
OB.VX_OT = data(:,41);
OB.VY_OT = data(:,42);

OB.VX_FILTERED = data(:,43);
OB.VY_FILTERED = data(:,44);

OB.GATE_AREA = data(:,45);

OB.RANSAC_X = data(:,46);
OB.RANSAC_Y = data(:,47);
OB.RANSAC_VX = data(:,48);
OB.RANSAC_VY = data(:,49);
OB.DETECTION_STAMP = data(:,50);

OB.AX_CMD = data(:,51);
OB.AY_CMD = data(:,52);
OB.P_TERM_Y = data(:,53);
OB.D_TERM_Y = data(:,54);

OB.VX_CMD = data(:,55);
OB.VY_CMD = data(:,56);

OB.X_SP = data(:,57);
OB.Y_SP = data(:,58);
OB.Z_SP = data(:,59);
OB.PSI_SP = data(:,60);
OB.X_REF = data(:,61);
OB.Y_REF = data(:,62);
OB.DIS_GATE = data(:,63);
OB.X_REF_LOCAL = data(:,64);
OB.Y_REF_LOCAL = data(:,65);

OB.R_REF = data(:,66);
OB.PSI_ERR = data(:,67);
OB.R_MAX = data(:,68);

OB.Z_SP = data(:,69);
OB.VZ_SP = data(:,70);
OB.Z_OT = data(:,71);

OB.GATE_ASSIGN = data(:,72);

OB.TIME = data(:,1);
t0 = OB.TIME(1);
for i = 1:length(OB.TIME)
   OB.TIME(i) =  (OB.TIME(i)-t0)/512;
end

p = 1;

psi = -32.5/180*pi;
%psi = 0/180*pi;
rot_mat = [cos(psi) sin(psi);
    -sin(psi) cos(psi)];
for i = 1:length(OB.TIME)
   pos_OT = rot_mat*[OB.X_OT(i) OB.Y_OT(i)]'; 
   OB.X_OT(i) = pos_OT(1);
   OB.Y_OT(i) = pos_OT(2);
   vel_OT = rot_mat*[OB.VX_OT(i) OB.VY_OT(i)]';
   OB.VX_OT(i) = vel_OT(1);
   OB.VY_OT(i) = vel_OT(2);
end

for i = 2:length(OB.TIME)    
    if OB.POSE_X(i) ~= 0 && OB.POSE_X(i) ~= OB.POSE_X(i-1)
        OB.DETEC_TIME_LOCAL(p) = OB.TIME(i);
        OB.DETEC_X_LOCAL(p) = OB.POSE_X(i);
        OB.DETEC_Y_LOCAL(p) = OB.POSE_Y(i);
        OB.DETEC_Z_LOCAL(p) = OB.POSE_Z(i);    
        OB.DETEC_X_LOCAL_OT(p) = OB.X_OT(i)-first_gate_position(1);
        OB.DETEC_Y_LOCAL_OT(p) = OB.Y_OT(i)-first_gate_position(2);
        OB.DETEC_PSI_LOCAL(p) = OB.PSI(i);
        OB.GATE_AREA_LOCAL(p) = OB.GATE_AREA(i);
        p = p+1;
    end
end

p = 1;
for i = 2:length(OB.TIME)
    if OB.DETECT_X_E(i) ~= 0 && OB.DETECT_X_E(i) ~= OB.DETECT_X_E(i-1)
        OB.DETEC_TIME_E(p) = OB.TIME(i);
        OB.DETEC_X_E(p) = OB.DETECT_X_E(i);
        OB.DETEC_X_OT(p) = OB.X_OT(i);
        OB.DETEC_Y_E(p) = OB.DETECT_Y_E(i);
        OB.DETEC_Y_OT(p) = OB.Y_OT(i);
        OB.DETEC_STAMP(p) = OB.DETECTION_STAMP(i);
        p = p+1;
    end
end



end