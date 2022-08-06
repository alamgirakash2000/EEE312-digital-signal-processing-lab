clc; clear; close all;

num = [1 1/3]; den = [1 , -1/2];
% impulse response
figure ();
subplot (211) ; stem ( impz (num , den ), 'filled');
title ('Impulse response');
subplot (212) ; zplane (num , den );