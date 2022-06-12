clc; clear; close all;
format compact;

% Declaring variables
a = [1 0.6]; b = [1];  % Coefficients of the difference equation
n = -10:20;            % Sequence
n0 = 0;                % Lag

%% Impulse response
Del = (n-n0) == 0;     % Impulse train
h = filter (b,a,Del);  % Solving the LD equation
figure(1)
stem(n,h,"filled"); title('Impulse Response'); grid on;
xlabel("Sequence"); ylabel("Signal Amplitube")

%% Unit step response 
u = (n-n0) >= 0;         %Unit step function
step = filter(b,a,u);
figure(2)
subplot(211); stem(n,step,"filled"); title('Step Response'); grid on;
xlabel("Sequence"); ylabel("Signal Amplitube");xlim([-10 20]);
%Varification
u = double(u);
stepVerified = conv(u, h); % Verification of Unit Step response
m = -20:40;
subplot(212); stem(m,stepVerified,"filled"); title('Step Response Varified'); grid on;
xlabel("Sequence"); ylabel("Signal Amplitube"); xlim([-10 20]);

%% Sinusoidal response
x = 0.5*sin(n);          %Sinosoidal function
sinusoid = filter(b,a,x);
figure(3)
subplot(211); stem(n,sinusoid,"filled"); title('Sinusoidal Response'); grid on;
xlabel("Sequence"); ylabel("Signal Amplitube");xlim([-10 20]);
% Varification
sinusoidVerified = conv(x, h); % Verification of sinusoidal response
subplot(212); stem(m,sinusoidVerified,"filled"); title('Sinusoidal Response Varified'); grid on;
xlabel("Sequence"); ylabel("Signal Amplitube"); xlim([-10 20]);