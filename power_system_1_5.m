clc;
clear all;
Va = [10 0]
Vb = [5 180]
Vc = [6 30]
Vabc = [Va; Vb; Vc]
magnitude = Vabc(:,1)
angle = pi / 180 * Vabc(:,2); 
Vrec = magnitude .* (cos(angle) + 1j * sin(angle));
a = cos(2 * pi / 3) + 1j * sin(2 * pi / 3);
A = [1 1 1; 1 a^2 a; 1 a a^2]

Va012 = inv(A) * Vrec;

Vabc0 = Va012(1) * [1; 1; 1];
Vabc1 = Va012(2) * [1; a^2; a]; 
Vabc2 = Va012(3) * [1; a; a^2];

figure;
subplot(1,4,1);
phasor(Vrec);
title('Defined Phasor');
disp('Rectangular Form of Vabc')
disp(Vrec)

subplot(1,4,2);
phasor(Vabc0); 
title('Zero Sequence Phasor');
disp('Rectangular Form of Zero Sq')
disp(Vabc1)

subplot(1,4,3);
phasor(Vabc1); 
title('Positive Sequence Phasor');
disp('Rectangular Form of Positive Sq')
disp(Vabc2)

subplot(1,4,4);
phasor(Vabc2); 
title('Negative Sequence Phasor');
disp('Rectangular Form of Negative Sq')
disp(Vabc2)

