clc; close all; clear;
format compact;

syms z;
Hz =  1/((z-0.91443+0.40475i)*(z-0.91443-0.40475i));
Hz = simplify(Hz)

% H(z) = 5000000000/(5000000000*z^2 - 9144300000*z + 5000023937)
% H(z) = 1/(z^2 - 1.8289*z + 1)
num = [0 0 1]; den = [1 -1.8289 1];
subplot(211);zplane(num,den); title("Z plane of the system")
impulseResponse = impz(num,den);
subplot(212); stem(impulseResponse, "filled");title("Impulse Response")