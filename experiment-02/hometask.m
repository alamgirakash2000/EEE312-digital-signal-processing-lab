clc; clear; close all;
format compact;

% Generating Chirp wave function
T = 100;
f =1/T;
wave = [10 * chirp(0 : 299, f, 300, 10 * f), zeros(1, 1000)];

% Generating Echo of the defiend wave function
lag = 600;
attenuation = 0.1;
echo = [zeros(1, lag), attenuation * wave(1 : 300), zeros(1, lag)];

% Adding noise of specific SNR
[corruptedWave, n] = addNoise(echo, -5);

% Cross Corelation of main wave with corrupted Wave
[ccf, lag] = xcorr(corruptedWave,wave);

% Ploting the results
subplot(411), plot(wave,'Linewidth',2), title('Wave'), xlim([0 1300]);
subplot(412), plot(echo,'Linewidth',2), title('Echo'), xlim([0 1300]);ylim([-1,1]);
subplot(413), plot(corruptedWave,'Linewidth',2), title('Corrupted Signal'), xlim([0 1300]);
subplot(414), plot(lag, ccf,'Linewidth',2), title('Lag and CCF')