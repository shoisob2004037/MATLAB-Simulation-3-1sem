clear; clc;
bitrate = 1000; 
sampling_rate = 1000; 
duration = 2;
binary_data = randi([0, 1], 1, bitrate * duration);
t = 0:1/sampling_rate:duration-1/sampling_rate;
frequency = 5;
s= sin(2*pi*frequency*t);
p = kron(binary_data, ones(1, sampling_rate / bitrate));
PAM = s.* p;
subplot(311)
plot(t,p);
xlabel('Time');
ylabel('Amplitude');
title('Pulse Wave');
subplot(312)
plot(t,s);
xlabel('Time');
ylabel('Amplitude');
title('Sine Wave');
subplot(313);
plot(t, PAM);
xlabel('Time');
ylabel('Amplitude');
title('PAM');
