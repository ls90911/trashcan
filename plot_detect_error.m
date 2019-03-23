function [] = plot_detect_error(plot_num)
global OB m n

for i = 1:length(OB.DETEC_X_OT) 
    if OB.DETEC_X_OT(i) < -10 | OB.DETEC_X_E(i)<-10
        OB.DETEC_X_E(i) = 0;
        OB.DETEC_X_OT(i) = 0;
        OB.DETEC_Y_E(i) = 0;
        OB.DETEC_Y_OT(i) = 0;
        OB.DETEC_ERROR_X(i) = 0;
        OB.DETEC_ERROR_Y(i) = 0;
    else
        OB.DETEC_ERROR_X(i) = OB.DETEC_X_OT(i) - OB.DETEC_X_E(i);
        OB.DETEC_ERROR_Y(i) = OB.DETEC_Y_OT(i) - OB.DETEC_Y_E(i);
    end
end

A = [];
B = [];
Aeq = [];
Beq = [];

LB = [ -5 -5 -5] ;

UB = [ 5 5 5] ;

LBX = [ -5 -5 -5 -5 -5 -5] ;

UBX = [ 5 5 5 5 5 5] ;

initial_guess_X = [0 0 0 0 0 0];
initial_guess  = [0 0 0]
[x,fval] = fmincon(@fitting_model_x,initial_guess_X, ...
    A,B,Aeq,Beq,LBX,UBX);

[y,fval] = fmincon(@fitting_model_y,initial_guess, ...
    A,B,Aeq,Beq,LB,UB);

X_PRE_OT = zeros(length(OB.DETEC_X_E),1);
Y_PRE_OT = zeros(length(OB.DETEC_Y_E),1);
for i = 1:length(OB.DETEC_X_E)
    X_PRE_OT(i) = OB.DETEC_X_E(i) + x(1) + x(2)*OB.DETEC_X_E(i)+x(3)*OB.DETEC_Y_E(i)+...
        x(4)*OB.DETEC_X_E(i)^2+x(5)*OB.DETEC_Y_E(i)^2+x(6)*OB.DETEC_X_E(i)*OB.DETEC_Y_E(i);
    Y_PRE_OT(i) = OB.DETEC_Y_E(i) + y(1) + y(2)*OB.DETEC_X_E(i)+y(3)*OB.DETEC_Y_E(i);
end


figure(plot_num)
subplot(2,1,1)
hold on
plot(OB.TIME,OB.X_OT);
plot(OB.DETEC_TIME_E,OB.DETEC_X_E,'*');
plot(OB.DETEC_TIME_E,X_PRE_OT);
subplot(2,1,2)
hold on
plot(OB.TIME,OB.Y_OT);
plot(OB.DETEC_TIME_E,OB.DETEC_Y_E,'*');
plot(OB.DETEC_TIME_E,Y_PRE_OT);


end