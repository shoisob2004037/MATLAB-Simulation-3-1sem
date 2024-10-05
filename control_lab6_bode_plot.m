clc;
clear all;
close all;

figure;

subplot(2,2,1);
num2 =[0 0 25];
den2 = [1 4 25];
bode(tf(num2,den2));
title("Bode diagram of 2nd-order system");


subplot(2,2,2);
num3 =[9 0.2 1];
den3 = [1 4 25 0];
bode(tf(num3,den3));
title("Bode diagram of 3rd-order system");


subplot(2,2,3);
num4 =[8 4];
den4 = [1 0.44 4 0 0];
bode(tf(num4,den4));
title("Bode diagram of 4th-order system");


subplot(2,2,4);
num5 = [40 24 3.2]; 
den5 = [1 7.04 10.28 8.0404 1.84 0];
bode(tf(num5,den5));
title("Bode diagram of 5th-order system");

grid on;
