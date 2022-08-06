clc; clear; close all;
format compact;

%% ztrans -  finding z-transforms
syms a n;
f = a^n;
ztrans(f)

%% iztrans - inverse z-transform 
% H(z) = z / (3z^2 - 4z + 1 )

syms z;
f = z/(3*z^2 - 4*z +1);
iztrans(f)

%% residuez - finding partial fraction (causal part)
% r = A or B or other residuez
% p = ploes
% c = any constant part
[r p c] = residuez([0 1], [3,-4,1])

%% impz - finding impulse response
y = impz([0 1], [3,-4,1],50);
stem(y);

%% Simplify - symplifying a function
syms z
Hz = (z-0.4)/((z-0.25)*(z-0.7-0.1i)*(z-0.7+0.1i));
Wz = Hz*(z/(z-0.5));
simplify(Wz)