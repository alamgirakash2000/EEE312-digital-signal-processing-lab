%% Encoding of a Continuous signal
close all; clc; clear all;
format compact;

%% Reading Audio file
Fs = 200;
Ts = 1/Fs;
tc = 0:1e-4;0.3;
td = 0: Ts: 0.3;
[s, fs] = audioread('speech_dft.wav');
normalizedSignal = s /max(s);
subplot(2,2,1)
plot(normalizedSignal)
title('Original Audio signal')
sound(s, fs);

%% Compression using u-Law
u=255;
%copressedSignal = (log(1+u.*normalizedSignal)/log(1+u)).*sign(normalizedSignal);
copressedSignal = compand(normalizedSignal,255, max(normalizedSignal), 'mu/compressor');
subplot(2,2,2);
plot(1:length(copressedSignal),copressedSignal)
title('Compressed Signqal');

%% Expansion of compressed signal
expandedSignal = (((1+u).^abs(copressedSignal) -1)/u).*sign(copressedSignal);
subplot(2,2,4)
plot(1:length(expandedSignal),expandedSignal)
title('Expanded Signal')

%% Uniformly Quantized Signal
bits = 16;
nlevel = 2^bits -1;
levels = linspace(min(copressedSignal ), max(copressedSignal ),nlevel );
%quantizedSignsal = quantize(levels, copressedSignal);
scallingFactor = normalizedSignal * (nlevel-1);
quantizedSignal = round(scallingFactor)*(max(copressedSignal )-min(copressedSignal ))/nlevel;
subplot(2,2,3);
stairs(quantizedSignal)
title('Uniformly quantized signal')


%% Error calculatin
error1 = sum(((quantizedSignal - normalizedSignal).^2)/length(quantizedSignal));
fprintf('Error 1: %f \n',error1)
error2 = sum(((expandedSignal - normalizedSignal).^2)/length(quantizedSignal));
fprintf('Error 2: %f \n',error2)