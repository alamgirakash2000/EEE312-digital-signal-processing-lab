clc; clear; close all;
format compact;

% Defining varibales
num =1 ;
den = [1 -1 0.5 -0 -3/4 1 1/8 -9/13];
subplot(211); zplane(num, den); title('Zplane of the system')
impulseResponse = impz(num, den);
subplot(212);stem(impulseResponse,'Linewidth',1); title("Impulse response of the system");

% from the above two plots - the system is unstable
disp("The system is unstable");