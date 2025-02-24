clc;
close all; 
clear all;
A=2;
fm=3; 
fs=20;
n=4;
t=0:1/(100*fm):1;
x=A*cos(2*pi*fm*t);
ts=0:1/fs:1;
xs=A*cos(2*pi*fm*ts);
x1=(xs+A)/(2*A);
L=2^n-1; 
xq=round(L*x1);
r=(2*A/L)*xq - A;
y = [];
for i=1:length(xq)
    y = [y double(dec2bin(xq(i),n)) - 48];
end
subplot(3,1,1)
plot(t,x,'linewidth',2), hold on
stem(ts,xs,'r','linewidth',2), hold on
title('Sampling'), ylabel('Amplitude'), xlabel('Time t (sec)')
subplot(3,1,2)
stem(ts,x1,'linewidth',2), hold on
stem(ts,xq,'r','linewidth',2)
plot(ts,xq,'r'), plot(t,(x+A)*L/(2*A),'--b'), hold off
title('Quantization'), ylabel('Levels L'), grid
subplot(3,1,3)
stairs([y y(end)],'linewidth',2,'Color',[0.5 0.5 0])
title('Encoding'), ylabel('Binary Signal'), xlabel('bits')
axis([0 length(y) -1 2]), grid
