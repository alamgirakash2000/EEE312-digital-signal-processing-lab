clc; clear; close all;
format compact;

%%Conitnuous signal
t = 0:1e-4:0.1;     % continuouse sequence
x = 0.5*sin(2*pi*200*t)+sin(2*pi*50*t);
period = 1/50;
fprintf("Period of continuous signal: %.4f s \n",period)
figure(1)
subplot(311); plot(t,x); title("Continous signal")

% Sampled signal
Fs = 1.25*2*200;
n = 0:1/Fs:0.1;
x_n  = 0.5*sin(2*pi*200*n)+sin(2*pi*50*n);
subplot(312); stem(n,x_n); title("Sampled signal signal")

% Adding noise to the signal
[y,noise] = addNoise([x_n zeros(1,100)], -5);
subplot(313); stem(y); title("Corrupted signal");

% ACF of corrupted signal
[acf_y , lag] = xcorr(y);

acf_y = acf_y/ max(acf_y);

figure(2)
stem(lag, acf_y); title("Auto correlation result")

[peaks, locs] = findpeaks(acf_y);

period2 = mean(diff(locs))*1/Fs;
fprintf("Period of signal: %.4f s \n",period2)


