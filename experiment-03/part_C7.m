clc; close all; clear;
format compact;

%%Given system: y(n) = 5/2 *y(n-1) - y(n-2) + x(n)
%%Z-transfrom: H(z) = 1/(1 - 5/2 * z^-1 + z^-2)
num = [1]; den = [1 -5/2 1];
subplot(311); zplane(num, den); title("Z plane of the system")

%%From the z-plane- this system has two poles and 0.5 and 2
% Possible ROCs - 
%    1. |z|<0.5 - Unstable and anticausal
%    2. |z|>2 - Unstable and causal
%    3. 0.5 <|z| < 2 - stable and non-causal

impulseResponse = impz(num, den);
subplot(312); stem(impulseResponse,'Linewidth',2); title("Impulse Response of the unstable system")
% so the system is not absolutely summale

%%To make this system summeable we can cancel the 
%%pole of the system of z=2
syms z
 Hz = (z-2)/((z-0.5)*(z-2));
 Hz = simplify(Hz)
 % so H(z) = 1/(z-0.5)
% for the new system
num =1; den = [1, -0.5];
impulseResponse = impz(num, den);
subplot(313); stem(impulseResponse,'Linewidth',2); title("Impulse response of the stable system")
