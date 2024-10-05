clc; 
fc1=20;
fc2=50;
fp=5;
amp=4;

t=0:0.001:1; 
c1=amp.*sin(2*pi*fc1*t);
c2=amp.*sin(2*pi*fc2*t);

m=amp.*square(2*pi*fp*t)+amp;

for i=0:1000 
    if m(i+1)==0
        mm(i+1)=c2(i+1);
        else
        mm(i+1)=c1(i+1);
    end
end

subplot(4,1,1); 
plot(t,c1)
xlabel('Time')
ylabel('Amplitude')
title('Carrier 1 Wave')

subplot(4,1,2) 
plot(t,c2)
xlabel('Time')
ylabel('Amplitude')
title('Carrier 2 Wave')


subplot(4,1,3) 
plot(t,m)
xlabel('Time')
ylabel('Amplitude')
title('Binary Message Pulses')

subplot(4,1,4) 
plot(t,mm)
xlabel('Time')
ylabel('Amplitude')
title('Modulated Wave')