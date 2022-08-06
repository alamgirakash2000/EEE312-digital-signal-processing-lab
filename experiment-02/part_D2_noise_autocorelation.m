clear; clc; close;
format compact;

% Defining variable
lag = 500;
attenuation = 0.5;

% Wave and echo generation
wave = [10 * sin(linspace(0, 6 * pi, 300)), zeros(1, 1000)];
echo = [zeros(1, lag), attenuation * sin(linspace(0, 6 * pi,300)), zeros(1, lag)];

% Adding noise
[noise, n] = addNoise(echo, -10);

% Cross Corelation of main wave with added white noise
[ccf, lag] = xcorr(noise,wave);

% Ploting the results
subplot(411), plot(wave,'Linewidth',2), title('Sent Signal'), xlim([0 1300]);
subplot(412), plot(echo,'Linewidth',2), title('Reflected signal'), xlim([0 1300]);ylim([-1,1]);
subplot(413), plot(noise,'Linewidth',2), title('Reflected with noise'), xlim([0 1300]);
subplot(414), plot(lag, ccf,'Linewidth',2), title('Autocorrelation of Noisy signal')

function [corruptedSignal, noise] = addNoise(x,SNR)
%Generating white noise for SNR(DB)
Px = sum(x.^2)/length(x);
Py = Px / (10^(SNR/10));
noise = sqrt(Py)*randn(1, length(x));

%Generate Corrupted input
corruptedSignal = noise+x;
end