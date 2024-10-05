 clc;
 clear all;
 syms t;
 %Practice Problem 1.1
 ft=3*exp(-2*t);
 Fs=laplace(ft)
 %Practice Problem 1.2
 ft2=exp(-2*t)*(1-cos(t));
 Fs2=laplace(ft2)
 %Practice Problem 1.3
 syms s t;
 Fs=1/(s*(s+2));
 ft=ilaplace(Fs)
 %
 Fs2=(s^2+2*s+3)/(s^3+6*s^2+12*s+8);
 ft2=ilaplace(Fs2)
 %
 num = [2 8 6];
 den = [1 5 11 10 0];
 sys = tf(num,den)
 

 %Lab works P-1
 %a
 ft=exp(2*t);
 Fs=laplace(ft)
 %b
 ft=sin(2*t);
 Fs=laplace(ft)
 %c
 ft=t*sin(2*t);
 Fs=laplace(ft)
 %d
 f = 1;
 F = laplace(f, t, s)
 %Lab works P-2
 %a
 Fs5=1/(s*(s+2));
 ft=ilaplace(Fs5)
 %b
 Fs6=1/(s*(s+2)+3);
 ft=ilaplace(Fs6)
 %c
 Fs7=(s+4)/(s*(s^2+2*s+4));
 ft=ilaplace(Fs7)
 %d
 Fs7=1/s;
 ft=ilaplace(Fs7)
 %Lab works P-3
 %a
 numerator = [1 2 3];   
 denominator = [1 4 4];
 res =  residue(numerator,denominator);
 disp(res)
 [r, p, k] = residue(numerator, denominator);

 fprintf('Partial Fraction Expansion:\n');
 for i = 1:length(r)
    fprintf('Term %d: Residue = %f, Pole = %f\n', i, r(i), p(i));
 end
 fprintf('Constant Term: %f\n', k);
 %b
 numerator = 1;
 denominator = [1 2];  
 denominator_poly = [1 -0.5 1.5];  
[r, p, k] = residue(numerator, conv(denominator, denominator_poly));
fprintf('Partial Fraction Expansion:\n');
for i = 1:length(r)
    fprintf('Term %d: Residue = %f, Pole = %f\n', i, real(r(i)), real(p(i)));
end
fprintf('Constant Term: %f\n', real(k));
%c
numerator = 1;
denominator = [1 0 0 2]; 
[r, p, k] = residue(numerator, denominator);
fprintf('Partial Fraction Expansion:\n');
for i = 1:length(r)
    fprintf('Term %d: Residue = %f, Pole = %f\n', i, real(r(i)), real(p(i)));
end
fprintf('Constant Term: %f\n', real(k));
%d
numerator = [1 8 6]; 
denominator = [1 2 3 4]; 
[r, p, k] = residue(numerator, denominator);
fprintf('Partial Fraction Expansion:\n');
for i = 1:length(r)
    fprintf('Term %d: Residue = %f, Pole = %f\n', i, real(r(i)), real(p(i)));
end
fprintf('Constant Term: %f\n', real(k));



