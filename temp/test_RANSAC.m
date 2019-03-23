clear
clc
close all
clear global

time = [27.96 27.99 28.3 28.07 28.15 28.27];
measurement = [-0.06 -0.168 -0.054 0.06 0.11 0.35];
prediction = [-0.77 -0.78 -0.79 -0.81 -0.82 -0.85];

tf = time(end);
for i = 1:length(time)
   time(i) = time(i) - tf;
end

error = prediction - measurement;

p_x = polyfit(time,error,1);
fitted_x = polyval(p_x,time);

figure(1)
hold on
plot(time,error,'.');
plot(time,fitted_x);
xlabel('time[s]');
ylabel('delta_x [m]');