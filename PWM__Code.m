clc;
close all;

fc = 200; 
fm = 50;   
fs = 10000; 

t = 0:1/fs:4/fm; 
mt = sin(2*pi*fm*t);  
ct = sawtooth(2*pi*fc*t); 

pwm_signal = mt > ct;

figure;

subplot(2,1,1);
plot(t, mt, 'r--', 'LineWidth', 1.5); 
hold on;
plot(t, ct, 'b', 'LineWidth', 1.5);  
title('Message and Carrier Signals');
xlabel('Time (s)');
ylabel('Amplitude');
legend('Message Signal', 'Carrier Signal');
hold off;

subplot(2,1,2);
plot(t, pwm_signal, 'k', 'LineWidth', 1.5);  
title('PWM Signal');
xlabel('Time (s)');
ylabel('Amplitude');
ylim([-0.1 1.1]); 

print -depsc2 PWM.eps;
