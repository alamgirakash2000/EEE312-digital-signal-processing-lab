clc;clear;close all;
format compact;

% Defining variables
a = [1 0.6]; b =[1 0 1];    % Coefficients of the equation
n =-10:20;                  % Sequence
n0 = 0;                     % lag
u = (n-n0)>= 0;             % Unit step funtion

step = filter(1, a, u);     % step response for y(n)+0.6y(n-1) = x(n)

[y,seq] = signalAddition(step, n , step, n+2);
subplot(211); stem(seq,y,"filled"); title('Step Response'); grid on;
xlabel("Sequence"); ylabel("Signal Amplitube"); xlim([-10 20]);

% Varification
stepVerified = filter(b,a,u);
subplot(212); stem(n,stepVerified,"filled"); title('Step Response Varified'); grid on;
xlabel("Sequence"); ylabel("Signal Amplitube"); xlim([-10 20]);