function reference_generator()
close all

wp = [5,0,degtorad(0);...
    6,2,degtorad(90);...
    6,8,degtorad(90);...
    4,10,degtorad(180);...
    0,10,degtorad(180)];
p_wp = 1;

p0 = [0,1];
v0 = [0,0];

k_p_x = 1.0;
k_v_x = 2;

k_p_y = 20;
k_v_y = 10;


sim_time = 20;
step = 0.1;


ref_x = zeros(sim_time/step,2);
ref_y = zeros(sim_time/step,2);
ref_x_local = zeros(sim_time/step,2);
ref_y_local = zeros(sim_time/step,2);
time = zeros(sim_time/step,1);



for i = 1:size(ref_x,1)-1
   if i == 1
      ref_x(i,:) = [p0(1) 0];
      ref_y(i,:) = [p0(2) 0];
      sp_heading = wp(p_wp,3);
      R_E_B = [cos(sp_heading) sin(sp_heading);-sin(sp_heading) cos(sp_heading)];
      p_local = R_E_B*([ref_x(i,1) ref_y(i,1)]' - wp(p_wp,1:2)');
      v_local = R_E_B*v0';
      ref_x_local(i,:) = [p_local(1) v_local(1)];
      ref_y_local(i,:) = [p_local(2) v_local(2)];      
   end
   

   if(norm([ref_x(i,1)-wp(p_wp,1),ref_y(i,1)-wp(p_wp,2)])< 0.1 && p_wp<size(wp,1))
      p_wp = p_wp + 1;
      sp_heading = wp(p_wp,3);
      R_E_B = [cos(sp_heading) sin(sp_heading);-sin(sp_heading) cos(sp_heading)];
      
      p_local = R_E_B*([ref_x(i,1) ref_y(i,1)]' - wp(p_wp,1:2)');
      v_local = R_E_B*([ref_x(i,2) ref_y(i,2)]');
      
      ref_x_local(i,:) = [p_local(1) v_local(1)];
      ref_y_local(i,:) = [p_local(2) v_local(2)];
   end
   sp_heading = wp(p_wp,3);
   R_E_B = [cos(sp_heading) sin(sp_heading);-sin(sp_heading) cos(sp_heading)];
   time(i+1) = step*(i+1);
   %% generate reference in local frame
    a_x = [0-ref_x_local(i,1)]*k_p_x-k_v_x*ref_x_local(i,2);
    a_y = [0-ref_y_local(i,1)]*k_p_y-k_v_y*ref_y_local(i,2);
    
    ref_x_local(i+1,:) = ref_x_local(i,:) + step*[ref_x_local(i,2) a_x];
    ref_y_local(i+1,:) = ref_y_local(i,:) + step*[ref_y_local(i,2) a_y];
    
   %% transfer reference back to global frame
    ref_global_p = R_E_B'*[ref_x_local(i+1,1) ref_y_local(i+1,1)]';
    ref_global_v = R_E_B'*[ref_x_local(i+1,2) ref_y_local(i+1,2)]';
       
    ref_x(i+1,:) = [ref_global_p(1)+wp(p_wp,1) ref_global_v(1)];
    ref_y(i+1,:) = [ref_global_p(2)+wp(p_wp,2) ref_global_v(2)];
end

figure(1)
subplot(2,1,1)
plot(time,ref_x(:,1))
subplot(2,1,2)
plot(time,ref_y(:,1))

figure(2)
subplot(2,1,1)
plot(time,ref_x_local(:,1))
subplot(2,1,2)
plot(time,ref_y_local(:,1))

figure(3)
plot(ref_x(:,1),ref_y(:,1));
grid on
xlabel('x[m]')
ylabel('y[m]')

end