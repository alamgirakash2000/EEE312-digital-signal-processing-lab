clc; clear; close all;
format compact;

% variables
num = [1 0 0]; den = [1 -7/3 2/3];
% Pole-Zero Map
subplot(311); zplane(num, den)

% Finding poles
[r p c] = residuez(num,den);
