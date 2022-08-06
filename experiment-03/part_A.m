clear;clc;close all;

%% Z transform of Delta function
syms n a f y m w r;
f = kroneckerDelta(n);
y = ztrans(f);
fprintf('The z transform of delta function is: %d ',y);
fprintf('\n')

%% Ztransform of Unit Step function
f = heaviside(n) + 0.5*kroneckerDelta(n);
fprintf('The z transform of Step function is: ');
ztrans(f)

%% z transform of Del(n-m)
f = kroneckerDelta(n-m);
fprintf('The z transform of delta(n-m) function is: ');
ztrans(f)
 fprintf('\n')
 
%% z transform of a^nu(n)
 f = a^n;
fprintf('The z transform of a^nu(n) function is: ');
ztrans(f)
fprintf('\n')

%% Z transform of na^nu(n)
f = n*a^n;
 fprintf('The z transform of na^nu(n) function is: ');
ztrans(f)
 fprintf('\n')

 %% Z transform of cos(wn)u(n)
 f = cos(w*n);
 fprintf('The z transform of na^nu(n) function is: ');
 ztrans(f)
 fprintf('\n')

 %% Z transform of sin(wn)u(n)
f = sin(w*n);
fprintf('The z transform of na^nu(n) function is: ');
ztrans(f)