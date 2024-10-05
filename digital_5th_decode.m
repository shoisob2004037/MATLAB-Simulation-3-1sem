clear all;
close all;
clc;
m = [ 0 0 1;
      0 1 0;
      0 1 1;
      1 0 0;
      1 0 1;
      1 1 0];
P = [1 1 1;
     1 1 0;
     1 0 1];

I = [1 0 0;
     0 1 0;
     0 0 1];

G = [I, P];

H = [P', I];

enc = mod(m * G, 2);
received = enc;
disp(received);

received(2, 3) = mod(received(2, 3) + 1, 2); 
disp('Received Codewords with Error (if any):')
disp(received)

for i = 1:size(received, 1)
    syndrome = mod(received(i, :) * H', 2);
    if isequal(syndrome, [0 0 0])
        disp(['Codeword ', num2str(i), ' is correct.'])
    else
        disp(['Codeword ', num2str(i), ' has an error. Syndrome: ', num2str(syndrome)])
        error_position = bi2de(syndrome, 'left-msb');
        received(i, error_position) = mod(received(i, error_position) + 1, 2);
        
        disp(['Corrected Codeword: ', num2str(received(i, :))])
    end
end
disp('Final Decoded Messages (after correction):')
decoded = received(:, 1:3);
disp(decoded)
