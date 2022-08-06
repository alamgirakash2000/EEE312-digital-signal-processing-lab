clc; clear; close all;
format compact

% Numerator and Denumerator
num = [2, 16, 44, 56, 31];
den = [3, 3, -15, 18, -12];

% Finding residues, poles and constant
[r, p, c] = residuez (num , den);

% viewing z-plane
figure (); zplane (num , den );
