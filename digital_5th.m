clc;
clear all;
close all;

m = [ 0 0 0; 0 0 1; 0 1 0; 0 1 1; 
    1 0 0;1 0 1;1 1 0;1 1 1]

P = [1 1 1; 1 1 0; 1 0 1];

I = [1 0 0; 0 1 0; 0 0 1];

G = [I, P]
enc = mod(m * G, 2);
disp('Encoded')
for i = 1:size(m, 1)
    disp('DATA:')
    disp(m(i, :))
    disp('Code Word:')
    disp(enc(i, :))
end

