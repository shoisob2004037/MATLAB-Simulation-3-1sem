clc;
clear all;
a=[400,230;110,66;33,22;11,6.6;0.4,0.23];
fprintf(['1:Primary Transmission\n' ...
    '2:Primary Distribution\n' ...
    '3: Secondary Transmission\n' ...
    '4:Secondary Distribution\n' ...
    '5:Tertiary Distribution\n\n'])
b=input('Enter any serial number:');
fprintf('Line voltage: %.3f KV\n Phase Voltage: %.3f KV\n',a(b,1),a(b,2))