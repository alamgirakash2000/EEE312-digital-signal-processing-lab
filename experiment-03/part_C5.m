clear;close all;clc;
format compact;

% Define variables
num = [3 -4 0];den = [1 -3.5 1.5];

[residues,poles,constant] = residuez(num,den);

fprintf('The constant Term is: %f \n',constant);
fprintf('The poles are: %f \n',poles);
fprintf('The Residues are : %f \n',residues);
figure(1);
zplane(num,den);grid on;title('Pole-Zero plot');