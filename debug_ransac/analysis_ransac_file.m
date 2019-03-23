function [] = analysis_ransac_file(file_id)
global RANSAC
figure(100)
subplot(2,1,1)
hold on
plot(RANSAC{file_id}.TIME,RANSAC{file_id}.X_PRE);
plot(RANSAC{file_id}.TIME,RANSAC{file_id}.X_MEAS,'*');
plot(RANSAC{file_id}.TIME,RANSAC{file_id}.X_EST);
legend('prediction','measurement','estimation');
for i = 1:length(RANSAC{file_id}.TIME_STAMP)
   label = num2str(RANSAC{file_id}.TIME_STAMP(i));
   text(RANSAC{file_id}.TIME(i),RANSAC{file_id}.X_MEAS(i),label);
end
ylabel('x[m]')

t0 = RANSAC{file_id}.TIME(1);
deltaT = RANSAC{file_id}.TIME-t0;
[k1,k0] = leastSquareFit(deltaT,RANSAC{file_id}.X_MEAS-RANSAC{file_id}.X_PRE);




subplot(2,1,2)
hold on
plot(RANSAC{file_id}.TIME,RANSAC{file_id}.Y_PRE);
plot(RANSAC{file_id}.TIME,RANSAC{file_id}.Y_MEAS,'*');
plot(RANSAC{file_id}.TIME,RANSAC{file_id}.Y_EST);
legend('prediction','measurement','estimation');
for i = 1:length(RANSAC{file_id}.TIME_STAMP)
   label = num2str(RANSAC{file_id}.TIME_STAMP(i));
   text(RANSAC{file_id}.TIME(i),RANSAC{file_id}.Y_MEAS(i),label);
end
ylabel('y[m]')
xlabel('time[s]')

figure(101)
subplot(2,1,1)
hold on
plot(RANSAC{file_id+1}.TIME,RANSAC{file_id+1}.X_PRE);
plot(RANSAC{file_id+1}.TIME,RANSAC{file_id+1}.X_MEAS,'*');
plot(RANSAC{file_id+1}.TIME,RANSAC{file_id+1}.X_EST);
legend('prediction','measurement','estimation');
for i = 1:length(RANSAC{file_id+1}.TIME_STAMP)
   label = num2str(RANSAC{file_id+1}.TIME_STAMP(i));
   text(RANSAC{file_id+1}.TIME(i),RANSAC{file_id+1}.X_MEAS(i),label);
end
ylabel('x[m]')

subplot(2,1,2)
hold on
plot(RANSAC{file_id+1}.TIME,RANSAC{file_id+1}.Y_PRE);
plot(RANSAC{file_id+1}.TIME,RANSAC{file_id+1}.Y_MEAS,'*');
plot(RANSAC{file_id+1}.TIME,RANSAC{file_id+1}.Y_EST);
legend('prediction','measurement','estimation');
for i = 1:length(RANSAC{file_id+1}.TIME_STAMP)
   label = num2str(RANSAC{file_id+1}.TIME_STAMP(i));
   text(RANSAC{file_id+1}.TIME(i),RANSAC{file_id+1}.Y_MEAS(i),label);
end
ylabel('y[m]')
xlabel('time[S]')

end

function [k1,k0] = leastSquareFit(t,x)
p = polyfit(t,x,1);
k1 = p(1);
k0 = p(2);
end