%% Problem - 01
clear; clc; close all;
format compact;

%% Answer - (i)
% H(z)  = 1/(1 - 0.9z^-1)
% Y(z) * (1 - 0.9z^-1) = X(z)
% Y(z) - 0.9*z^-1*Y(z) = X(z)
% y(n) - 0.9*y(n-1) = x(n)

%% Answer - (ii)
a = [1 -0.9]; b = [1];
n = -10:40;
step = n>=0;
stepResponse =  filter(b,a,step);
subplot(211); stem(n,stepResponse); title("Step Response")

sinusoid = sin(2*pi*10*n);
sinusoidResponse = filter(b,a, sinusoid);
subplot(212); stem(n,sinusoidResponse); title("Sinusoidal  Response")