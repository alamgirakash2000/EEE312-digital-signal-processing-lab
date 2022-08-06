clc; clear; close all;

num = [1]; den = [1 , -1];
% impulse response
figure ();
subplot (311) ; stem ( impz (num , den ), 'filled','Linewidth',2);
title ('Impulse response ');xlabel("n"); ylabel("y(n)")


% step response
u = ones (1 ,20);
subplot (312) ; stem ( filter (num , den , u), 'filled','Linewidth',2);
title ('Step response'); xlabel("n"); ylabel("y(n)")
subplot (313) ; zplane (num , den );
title ('Pole zero of $H(z) = \frac {1}{1 - z ^{ -1}} $ ROC $|z|>1$', 'Interpreter','latex ')