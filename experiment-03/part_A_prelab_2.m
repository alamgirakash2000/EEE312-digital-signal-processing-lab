clc; clear; close all;
format compact;

% Finding impulse response
num = [1 2];              % Numerator
den = [1 0.4 -0.12];      % Denumerator

y = impz(num,den,10);       % Impluse response

subplot(211), stem(y,'Linewidth',3), grid on; title("Impulse response from H(z)")
xlabel("n"); ylabel("y(n)");

% Finding impulse response using filter function
n = 0:10;
h = (n==0);
z = filter(num,den,h);
subplot(212), stem(z,'Linewidth',3), grid on; title("Impulse response using filter function")
xlabel("n"); ylabel("y(n)");
