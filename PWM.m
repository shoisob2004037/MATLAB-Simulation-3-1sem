clear all;
close all;
Fc = 60;                     
Fs = 1000;  
duration = 2;
t1 = 0:1/Fs:duration;
t2 = 0:0.001:duration; 
m =0.9* cos(2*pi*1*t1);
x2 = ((square(2*pi*t2*10))+1)/2;
x = sawtooth(2*pi*t2*10);
for i=1:length(x)
if (m(i)>=x(i))
    pwm(i)=1; 
else
    pwm(i)=0;
end
end
subplot(3,1,1)
plot(t1,m)
subplot(3,1,2)
plot(t1,x)
subplot(3,1,3)
plot(t1,pwm)