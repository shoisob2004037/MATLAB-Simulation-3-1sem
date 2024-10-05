clc;
clear all;
close all;

disp('Impedance matrix Z:');
z = [ 0, 0.02 + 1i*0.04, 0.01 + 1i*0.03;
      0.02 + 1i*0.04, 0, 0.0125 + 1i*0.025;
      0.01 + 1i*0.03, 0.0125 + 1i*0.025, 0 ]
a1 = size(z, 1)
b1 = size(z, 2)
y = zeros(a1, b1)
disp('Admittance matrix Y:');
for a = 1:a1
    for b = 1:b1
        if z(a, b) ~= 0
            y(a, b) = 1 / z(a, b);
        else
            y(a, b) = 0;
        end
    end
end
disp(y);
disp(y(1,2))
% Calculate the Y Bus matrix
disp('Y Bus matrix:');
Y = zeros(a1, b1);
for a = 1:a1
    for b = 1:b1
        if a == b
            s = 0;
            for k = 1:a1
                if k ~= a
                    s = s + y(a, k);
                end
            end
            Y(a, b) = s;
        else
            Y(a, b) = -y(a, b);
        end
    end
end
disp(Y);

V1 = 1.05 + 0i; 
V2 = 1 + 0i;
V3 = 1 + 0i;

S2 = ((256.6 + 1i*110.2)) / 100; 
S3 = ((138.6 + 1i*45.2)) / 100; 
P2 = ((-256.6 + 1i*110.2)) / 100; 
P3 = ((-138.6 + 1i*45.2)) / 100;

max_iter = 12;
tolerance = 1e-5;

disp('Iteration             V2                          V3             Error');
% Gauss-Seidel iterations
for iteration = 1:max_iter
    V2_old = V2;
    V3_old = V3;
    V2 = ((P2 / conj(V2_old) + y(1, 2) * V1 + y(2, 3) * V3_old)) / (y(1, 2) + y(2,3));
    
    V3 = ((P3 / conj(V3_old) + y(1, 3) * V1 + y(2, 3) * V2)) / (y(1, 3) + y(2,3));

    error = max(abs(V2 - V2_old), abs(V3 - V3_old));
    fprintf('   %d       %10.4f %10.4fi    %10.4f %10.4fi    %10.6f\n', iteration, real(V2), imag(V2), real(V3), imag(V3), error);
    if error < tolerance
        break;
    end
end
disp('Final calculated voltages after Gauss-Seidel iterations:');
disp(['V2: ', num2str(V2)]);
disp(['V3: ', num2str(V3)]);




