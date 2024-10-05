clc;
clear all;
t=0:.001:1; 
fc=40;
fm=10;
amp=5;
c=amp.*sin(2*pi*fc*t);
m=square(2*pi*fm*t);
x=c.*m;
subplot(3,1,1) 
plot(t,c)
xlabel('Time')
ylabel('Amplitude')
title('Carrier')
subplot(3,1,2)
plot(t,m)
xlabel('time')
ylabel('amplitude')
title('Message Signal')
subplot(3,1,3) 
plot(t,x)
xlabel('t')
ylabel('y')
title('PSK')