clear all;
clc;

J = 3.2284e-6;
b = 3.5077e-6; 
K = 0.0274;   
Kt = 0.000274;
Ke = 0.0274;
R = 19;        
L = 2.75e-6;  

disp('Moment of inertia of the rotor (J):');
disp(J);
disp('Damping ratio of the mechanical system (b):');
disp(b);
disp('Electromotive force constant (K):');
disp(K);
disp('Electric resistance (R):');
disp(R);
disp('Electric inductance (L):');
disp(L);

modelPath = 'C:\Users\Asus\Documents\MATLAB\control_lab5_sim.slx'; 
modelName = 'control_lab5_sim.slx'; 

open_system(modelPath);
sim(modelName);
