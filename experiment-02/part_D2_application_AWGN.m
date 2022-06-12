clc;clear;close;

T = 2e-3;
tstep = T / 100;
t = tstep : tstep : 3 * T;
x = 2 * sin(2 * pi * t / T);
Px = sum(x .^ 2) / length(x);
SNR = [0 -5 -10];
figure(1)
for i = 1 : length(SNR)
    Py = Px / 10 ^ (SNR(i) / 10);
    n = sqrt(Py) * randn(1, length(t));
    y = x + n;
    ACF_x = normalize(xcorr(x));
    ACF_n = normalize(xcorr(n));
    ACF_y = normalize(xcorr(y));
    ACF_y(length(x)) = .4 * max(ACF_y);
    subplot(2, 2, i + 1), plot(tstep * (1 : length(ACF_y)), ACF_y),
    title(['ACF for ', num2str(SNR(i)), ' dB']);
    hold on
end
subplot(221), plot(tstep * (1 : length(ACF_x)), ACF_x,'Linewidth',2), title('ACF for Input');
figure(2)
subplot(211), plot(t, x,'Linewidth',2), title('Input Signal');
subplot(212), plot(t, n,'Linewidth',2), title('Corrupted Signal');

function R=normalize(x)
R=x/max(x);
end