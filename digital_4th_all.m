clc, clear all, close all;
x = [1 0 1 0 0 0 1 1 0 1 1 0 1 0];
N = length(x)
Tb = 0.0001; 
nb = 100; 
t1 = Tb/nb:Tb/nb:Tb*N;  

unipolar_NRZ = zeros(1, N*nb)
polar_NRZ = zeros(1, N*nb);
unipolar_RZ = zeros(1, N*nb);
bipolar_RZ = zeros(1, N*nb);
manchester = zeros(1, N*nb);
diff_manchester = zeros(1, N*nb);

% Unipolar NRZ 
for i = 0:N-1
    if x(i+1) == 1
        unipolar_NRZ(i*nb+1:(i+1)*nb) = 1;
    else
        unipolar_NRZ(i*nb+1:(i+1)*nb) = 0;
    end
end

% Polar NRZ 
for i = 0:N-1
    if x(i+1) == 1
        polar_NRZ(i*nb+1:(i+1)*nb) = 1;
    else
        polar_NRZ(i*nb+1:(i+1)*nb) = -1;
    end
end

% Unipolar RZ 
for i = 0:N-1
    if x(i+1) == 1
        unipolar_RZ(i*nb+1:(i*nb + nb/2)) = 1;
    else
        unipolar_RZ(i*nb+1:(i+1)*nb) = 0;
    end
end

% Bipolar RZ 
last_bipolar = -1;
for i = 0:N-1
    if x(i+1) == 1
        last_bipolar = -last_bipolar;
        bipolar_RZ(i*nb+1:(i*nb + nb/2)) = last_bipolar;
    else
        bipolar_RZ(i*nb+1:(i+1)*nb) = 0;
    end
end

% Manchester 
for i = 0:N-1
    if x(i+1) == 1
        manchester(i*nb+1:(i*nb + nb/2)) = 1;
        manchester((i*nb + nb/2+1):(i+1)*nb) = 0;
    else
        manchester(i*nb+1:(i*nb + nb/2)) = 0;
        manchester((i*nb + nb/2+1):(i+1)*nb) = 1;
    end
end

% Differential Manchester 
prev_val = 1;  
for i = 0:N-1
    if x(i+1) == 1
        diff_manchester(i*nb+1:(i*nb + nb/2)) = prev_val;
        diff_manchester((i*nb + nb/2+1):(i+1)*nb) = -prev_val;
    else
        prev_val = -prev_val;
        diff_manchester(i*nb+1:(i*nb + nb/2)) = prev_val;
        diff_manchester((i*nb + nb/2+1):(i+1)*nb) = -prev_val;
    end
end

figure;
%subplot(6, 1, 1);
stairs([x x(end)], 'LineWidth', 2);
title('Binary Input Signal');
ylabel('Amplitude');
subplot(6, 1, 2);
plot(t1, unipolar_NRZ, 'LineWidth', 2.5);
grid on;
axis([0 Tb*N -0.5 1.5]);
xlabel('Time (Sec)');
ylabel('Amplitude');
title('Unipolar NRZ');
subplot(6, 1, 3);
plot(t1, polar_NRZ, 'LineWidth', 2.5);
grid on;
axis([0 Tb*N -1.5 1.5]);
xlabel('Time (Sec)');
ylabel('Amplitude');
title('Polar NRZ');

subplot(6, 1, 4);
plot(t1, unipolar_RZ, 'LineWidth', 2.5);
grid on;
axis([0 Tb*N -0.5 1.5]);
xlabel('Time (Sec)');
ylabel('Amplitude');
title('Unipolar RZ');

subplot(6, 1, 5);
plot(t1, bipolar_RZ, 'LineWidth', 2.5);
grid on;
axis([0 Tb*N -1.5 1.5]);
xlabel('Time (Sec)');
ylabel('Amplitude');
title('Bipolar RZ');

subplot(6, 1, 6);
plot(t1, manchester, 'LineWidth', 2.5);
hold on;
plot(t1, diff_manchester, '--', 'LineWidth', 2);
grid on;
axis([0 Tb*N -1.5 1.5]);
xlabel('Time (Sec)');
ylabel('Amplitude');
title('Manchester and Differential Manchester');
legend('Manchester', 'Differential Manchester');
hold off;
