clc;
close all; 
clear all;
fc=100;
fm=fc/10; 
fs=100*fc;
amp =0.5;
t=0:1/fs:4/fm; 
mt=cos(2*pi*fm*t);
ct=amp*square(2*pi*fc*t)+amp;
st=mt.*ct; 
subplot(3,1,1);
plot(t,mt);
title('Message signal');
xlabel('Time Period');
ylabel('Amplitude');
subplot(3,1,2);
plot(t,ct);
title('Carrier signal');
xlabel('Time Period');
ylabel('Amplitude');
subplot(3,1,3);
plot(t,st);
title('PAM wave');
xlabel('timeperiod');
ylabel('amplitude');
print -depsc2 PAM.eps


