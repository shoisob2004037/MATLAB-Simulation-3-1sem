clc;
clear all;
close all;

% First transfer function
num1 = [1];
den1 = [1 10];
tf1 = tf(num1, den1)
p1 = pole(tf1)
z1 = zero(tf1)

% Plot poles and zeros for tf1
figure;
pzmap(tf1)
title('Poles and Zeros of tf1');
grid on;

% Second transfer function
num2 = [1];
den2 = [1 1];
tf2 = tf(num2, den2)
p2 = pole(tf2)
z2 = zero(tf2)

% Plot poles and zeros for tf2
figure;
pzmap(tf2);
title('Poles and Zeros of tf2');
grid on;

% Third transfer function
num3 = [1 0 1];
den3 = [1 4 4];
tf3 = tf(num3, den3)
p3 = pole(tf3)
z3 = zero(tf3)

% Plot poles and zeros for tf3
figure;
pzmap(tf3);
title('Poles and Zeros of tf3');
grid on;

% Exercise transfer function
num4 = [6 0 1];
den4 = [1 3 3 7];
tf4 = tf(num4, den4)
p4 = pole(tf4)
z4 = zero(tf4)

% Plot poles and zeros for tf4
figure;
pzmap(tf4);
title('Poles and Zeros of tf4');
grid on;
