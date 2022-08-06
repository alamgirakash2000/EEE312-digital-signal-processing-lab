clc; clear; close all;
format compact;

% Variables
Fs = 100e3;
dt = 1 / Fs;
PulseTrainPeriod = 1e-3;
DutyCycle = .1;
PulseWidth = DutyCycle * PulseTrainPeriod;
freqAnalog = 1 / PulseTrainPeriod;
timeInterval = -PulseTrainPeriod / 2 : dt : PulseTrainPeriod / 2;
n = timeInterval / dt;
L = PulseWidth / dt;
RectangularPulse = zeros(1, length(timeInterval));
RectangularPulse((abs(n) <= L / 2)) = 1.1;

figure(1)
subplot(211)
plot(timeInterval, RectangularPulse, 'k', 'linewidth', 2)
xlabel('Time (seconds)', 'fontsize', 14);
ylabel('x(t)', 'fontsize', 14);
title('(a) Original continuous signal', 'fontsize', 14);
subplot(212)
stem(n, RectangularPulse, '.k', 'linewidth', 2)
xlabel('Index, n', 'fontsize', 14);
ylabel('x(n)', 'fontsize', 14);
title('(b) Sampled discrete signal', 'fontsize', 14);


N = length(RectangularPulse);
if ~(mod(N, 2))
    k = -N : N;
else
    k = -(N - 1) : N - 1;
end
c = zeros(1, length(k));
for j1 = 1 : length(k)
    for j2 = 1 : length(RectangularPulse)
        c(j1) = c(j1) + 1 / N * RectangularPulse(j2) * exp(-1i * 2 * pi * k(j1) * n(j2) / N);
    end
end
figure(2)
subplot(211)
stem(k, abs(c), '.k', 'linewidth', 2);xlabel('k', 'fontsize', 14);
ylabel('|c_k|', 'fontsize', 14);
title('Fourier series coefficients c_k', 'fontsize', 14);
subplot(212)
stem(k, angle(c) * 180 / pi, '.k', 'linewidth', 2)
xlabel('k', 'fontsize', 14),
ylabel('angle(c_k)', 'fontsize', 14)

figure(3)
stem(k * freqAnalog, c, '.k', 'linewidth', 2);
xlabel('Frequency (Hz)', 'fontsize', 14);
ylabel('c_k', 'fontsize',14);
title('Fourier series coefficients c_k', 'fontsize', 14);

tReconMax = PulseTrainPeriod / 2;
tRecon = -tReconMax : dt : tReconMax;
nRecon = tRecon / dt;
RectangularPulseRecon = zeros(1, length(nRecon));
for j1 = 1 : length(k)
    for j2 = 1 : length(RectangularPulseRecon)
        RectangularPulseRecon(j2) = RectangularPulseRecon(j2) + c(j1) * exp(1i * 2 * pi * k(j1) * nRecon(j2) / N);
    end
end

figure(4)
subplot(211)
stem(nRecon, RectangularPulseRecon, '.k', 'linewidth', 2)
xlabel('n', 'fontsize', 14);
ylabel('x_{reconstructed}', 'fontsize', 14);
title('Reconstructed signal', 'fontsize', 14);
subplot(212)
plot(tRecon, RectangularPulseRecon, 'k', 0, 0, 'linewidth', 2)
xlabel('t', 'fontsize', 14);
ylabel('x_{reconstructed}', 'fontsize', 14);
title('Reconstructed signal', 'fontsize', 14);