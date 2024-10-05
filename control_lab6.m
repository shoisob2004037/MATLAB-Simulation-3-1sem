clc;
clear all;

num = 10; 
den = [1 120];

G = tf(num, den);  
H = 1; 
sys_cl = feedback(G, H); 

step_error = 1/(1 + dcgain(G)); 

ramp_error = 1 / (dcgain(G)); 

parabolic_error = inf;

fprintf('Steady-State Error for Step Input: %f\n', step_error); 
fprintf('Steady-State Error for Ramp Input: %f\n', ramp_error); 
fprintf('Steady-State Error for Parabolic Input: %f\n', parabolic_error); 

figure; 
subplot(3, 1, 1); 
step(sys_cl); 
title('Step Response'); 

subplot(3, 1, 2); 
t = 0:0.01:10;
ramp_input = t; 
lsim(sys_cl, ramp_input, t); 
title('Ramp Response'); 

subplot(3, 1, 3); 
t_parabola = 0:0.01:10; 
parabolic_input = 0.5 * t_parabola.^2; 
lsim(sys_cl, parabolic_input, t_parabola); 
title('Parabolic Response'); 

G_new = tf(num, [1 0]); 
sys_cl_new = feedback(G_new, H); 

step_error_new = 1/(1 + dcgain(G_new)); 
ramp_error_new = 1 / (dcgain(G_new)); 

fprintf('New Steady-State Error for Step Input: %f\n', step_error_new); 
fprintf('New Steady-State Error for Ramp Input: %f\n', ramp_error_new); 

figure; 
subplot(2, 1, 1); 
step(sys_cl_new); 
title('New Step Response'); 

subplot(2, 1, 2); 
lsim(sys_cl_new, ramp_input, t);
title('New Ramp Response');