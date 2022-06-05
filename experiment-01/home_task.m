clear; clc; close all;
format compact;

% Generating a sinusoidal signal from audio file and sampled it
[s, fs] = audioread('speech_dft.wav');
normalizedSignal = s /max(s);
figure(1)
stem(30000:35000,normalizedSignal(30000:35000),'.')
title('Original Audio signal')
xlabel('Sample number');
ylabel('Normalised signal strength');
%sound(normalizedSignal, fs);
fprintf('Frequency of the signal: %d Hz \n',fs);

% Compression using u-Law
u = 255;
compressedSignal = (log(1+u.*abs(normalizedSignal)))/(log(1+u)).*sign(normalizedSignal);
figure(2)
stem(30000:35000,compressedSignal(30000:35000),'.');
title('Compressed Audio File - Using u law');
xlabel('Sample number');
ylabel('Compressed signal values');


% Compression using built-in function to check the authenticity
compressedSignal2 = compand(normalizedSignal, u,max(normalizedSignal), 'mu/compressor');
figure(3)
stem(30000:35000,compressedSignal(30000:35000),'.');
title('Compressed Audio File using built in function');
xlabel('sample number');
ylabel('Compressed signal');

% Uniform quantization --- 16 bits
bits =16;
resolution = (max(compressedSignal)-min(compressedSignal))/(2^bits - 1);
quantizedSignal = round(compressedSignal/resolution)*resolution;
figure(4)
stairs(30000:35000,quantizedSignal(30000:35000));
title('Uniformly Quantized Audio File for 16 bits');
xlabel('sample number From 2000 to 3000th');
ylabel('Quantized signal');

% SQNR Calculation
N = length(normalizedSignal);
signalPower = (1/N)*sum(normalizedSignal.*normalizedSignal);
errors = quantizedSignal-compressedSignal;
noisePower = (1/N)*sum(errors.*errors);
SQNR_db =10*log10(signalPower/noisePower);
sqnr_db_theory = 4.77 + 10*log10(signalPower) - 10*log10(max(compressedSignal)^2) + 6*bits;
fprintf('For %d bit quantization\n',bits);
fprintf('SQNR(dB) from data is %f\n',SQNR_db);
fprintf('SQNR(dB) from theory is %f\n\n',sqnr_db_theory);

