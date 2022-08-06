clc;clear;close all;
format compact;

%%Part a
% Defining variable
N =500;            
t = linspace(0,10*pi,N+1);% Continuous Interval
x = sin(2*pi*50*t);

%%50Hz Frequency
n = 0 : N - 1;
x = x(1 : N);
r = zeros(1, N);
for i = 1 : N
    l = i - 1; %% Shifting amount
    r(i) = dot(x, sigShiftper2(x, l)) / N; %% Shifting and dot  product to get summation of multiplication of points at a time nstance
end
figure(1)
subplot(211), plot(n, x), title('Input Signal');grid on;xlabel('Sequence');ylabel('Amplitude');
subplot(212), plot(n, r), title('ACF Signal');grid on;xlabel('Sequence');ylabel('Amplitude');



%%Part B
T = 2e-3; tstep = T / 100;
t = tstep : tstep : T;
x = 2 * sin(2 * pi * t / T);
[rxx, lags] = xcorr(x);
figure(2);
subplot(211), plot(x,'Linewidth',2), title('Input Signal');grid on;
xlabel('Sequence');ylabel('Amplitude');
subplot(212), plot(lags, rxx,'Linewidth',2), title('ACF Signal');grid on;
xlabel('Lag');ylabel('Amplitude');

%%Part 2
T = 2e-3; tstep = T / 100;
t = tstep : tstep : 3*T;
x = 2 * sin(2 * pi * t / T);
[rxx, lags] = xcorr(x);
figure(3)
subplot(211), plot(x,'Linewidth',2), title('Input Signal');grid on;
xlabel('Sequence');ylabel('Amplitude');
subplot(212), plot(lags, rxx,'Linewidth',2), title('ACF Signal');grid on;
xlabel('Lag');ylabel('Amplitude');

%%Part C
x = awgn(zeros(1, 200), -5);
[c, nc] = xcorr(x);
figure(4)
subplot(211), plot(x,'Linewidth',2), title('Input Signal');grid on;xlabel('Sequence');ylabel('Amplitude');
subplot(212), plot(nc, c,'Linewidth',2), title('ACF Signal');grid on;xlabel('Lags');ylabel('Amplitude');

function y = sigShiftper2(x, l)
n = length(x);
x1 = x(1 : n - l); 
x2 = zeros(1, l);
y = [x2 x1];
end