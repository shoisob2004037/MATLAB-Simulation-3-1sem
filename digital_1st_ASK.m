clc
F1=50;
F2=10;
A=3;
t=0:0.001:1;
x=A.*sin(2*pi*F1*t)+(A/2);
u=A/2.*square(2*pi*F2*t)+(A/2);
v=x.*u;

subplot(311);
plot(t,x);
title('Carrier');
grid on;

subplot(312);
plot(t,u);
title('Square pulses');
grid on;

subplot(313);
plot(t,v)
title('ASK Signal')
grid on;