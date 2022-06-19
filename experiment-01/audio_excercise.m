clear;close all;clc; clf;
%% Read and plot Audio file
[y,Fs] = audioread('sample_audio.m4a');
Px = sum(y.^2);
%%Plotting the actual audio signal
subplot(2,2,1:2); plot(1:length(y),y);title('Audio file - Sampler Output');
xlabel('Sample number'); ylabel('Normalised signal strength');

%% Compression using u-Law
u = 255;
compressed_y = (log(1+u.*abs(y)))/(log(1+u)).*sign(y);
subplot(2,2,3); plot(1:length(compressed_y),compressed_y); title('Compressed Audio File - Using u law');
xlabel('Sample number'); ylabel('Compressed signal values');
%sound(compressed_y, Fs)

%% Checking output similarity using built in function
% compressed_y1 = compand(y,255, max(y),'mu/compressor');
% subplot(2,2,4); plot(1:length(compressed_y1),compressed_y1); title('Compressed Audio File using built in function');
% xlabel('sample number'); ylabel('Compressed signal');

%% Uniform quantization --- 16 bits
bits = 16;
DEL = (max(compressed_y) - min(compressed_y))/(2^bits-1);
levels = min(compressed_y):DEL:max(compressed_y);
y_quantized = quantize(levels,compressed_y);
figure
stairs(y_quantized(2500:3500),'Linewidth',2);
%% SQNR Calculation
P_noise = sum((y_quantized-compressed_y).^2);
sqnr_db = 10*log10(Px/P_noise);
sqnr_db_theory = 4.77 + 10*log10(Px) - 10*log10(max(compressed_y)^2) + 6*bits;
fprintf('For %d bit quantization\n',bits);
fprintf('SQNR(dB) from data is %f\n',sqnr_db);
fprintf('SQNR(dB) from theory is %f\n\n',sqnr_db_theory);