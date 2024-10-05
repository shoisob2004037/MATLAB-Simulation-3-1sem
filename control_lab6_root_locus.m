clc;
clear variables;
close all;

figure;
subplot(2,2,1);
num =[0 1 2];
den = [1 7 12];
rlocus(num,den)
v = [-6 6 -6 6];
axis(v);
grid on;
title("Root Locus Plot of G(s) = (K(s+2)/((s+3)(s+4))")

subplot(2,2,2);
num =[0 1 0.4];
den = [1 3.6 0 0];
rlocus(num,den)
v = [-6 6 -6 6];
axis(v);
grid on;
title("Root Locus Plot of G(s) = ")

subplot(2,2,3);
num =[0 1 3];
den = [1 5 20 16 0];
rlocus(num,den)
v = [-6 6 -6 6];
axis(v);
grid on;
title("Root Locus Plot of G(s) = ")

subplot(2,2,4);
num =[1 2 4];
den = [1 11.4 39 43.6 24 0];
rlocus(num,den)
v = [-6 6 -6 6];
axis(v);
grid on;
title("Root Locus Plot of G(s) = ")