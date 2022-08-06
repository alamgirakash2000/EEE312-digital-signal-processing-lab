clc; clear; close all; 
format compact;

% defining variables
num = [1]; den = [1, -2.5 , 1];
figure (1);
subplot (321) ; zplane (num , den ); title ('Pole zeros of H(z)');  
subplot (322) ; stem ( impz (num , den )); title (' Corresponding impulse -response ');

% Assuming system to be causal , and cancelling the pole at 2.
num1 = conv (num , [1 , -2]);
subplot (323) ; zplane (num1 , den ); title ('Pole zeros of H(z) ');
subplot (324) ; stem ( impz (num1 , den )); title (' Corresponding causal -impulse response ');

% Assuming system to be anticausal , and cancelling the pole at 1/2.
num2 = conv (num , [1 , -1/2]) ;
subplot (325) ; zplane (num2 , den ); title ('Pole zeros of H(z)');
subplot (326) ;
n = -20: -1;
h = - 2.^n;
stem (n,h); title (' Corresponding anticausal impulse response ');