clc; clear; close all;
format compact;

% Declaring variables
a = [1 0.6]; b = 1;    % Coefficients of the difference equation
n = -10:20;            % Sequence
n0 = 0;                % Lag

%% Impulse response
Del = (n-n0) == 0;     % Impulse train
h = filter (b,a,Del);  % Solving the LD equation
figure(1)
subplot(211); stem(n,h,"filled"); title('Impulse Response - Filter'); grid on;
xlabel("Sequence"); ylabel("Signal Amplitube")
% Iterative input
y = zeros(1,length(n))
for i = 2:30
   y(i) = - 0.6*y(i-1) + Del(i);
end

subplot(212); stem(n,y,"filled"); title('Impulse Response - Iterative'); grid on;
xlabel("Sequence"); ylabel("Signal Amplitube")

%% Unit step response 
u = (n-n0) >= 0;         %Unit step function
step = filter(b,a,u);
figure(2)
subplot(311); stem(n,step,"filled"); title('Step Response - Filter'); grid on;
xlabel("Sequence"); ylabel("Signal Amplitube");xlim([-10 20]);

% Iterative
y = zeros(1,length(n));
for i = 2:30
   y(i) = - 0.6*y(i-1) + u(i);
end
subplot(312); stem(n,y,"filled"); title('Step Response -Iterative'); grid on;
xlabel("Sequence"); ylabel("Signal Amplitube");xlim([-10 20]);

%Varification
u = double(u);
stepVerified = conv(u, h); % Verification of Unit Step response
m = -20:40;
subplot(313); stem(m,stepVerified,"filled"); title('Step Response - Conv'); grid on;
xlabel("Sequence"); ylabel("Signal Amplitube"); xlim([-10 20]);

%% Sinusoidal response
x = 0.5*sin(n);          %Sinosoidal function
sinusoid = filter(b,a,x);
figure(3)
subplot(311); stem(n,sinusoid,"filled"); title('Sinusoidal Response - Filter'); grid on;
xlabel("Sequence"); ylabel("Signal Amplitube");xlim([-10 20]);

% Iterative
y = zeros(1,length(n))
for i = 2:30
   y(i) = - 0.6*y(i-1) + x(i);
end
subplot(312); stem(n,y,"filled"); title('Sinusoidal Response- Iterative'); grid on;
xlabel("Sequence"); ylabel("Signal Amplitube");xlim([-10 20]);

% Varification
sinusoidVerified = conv(x, h); % Verification of sinusoidal response
subplot(313); stem(m,sinusoidVerified,"filled"); title('Sinusoidal Response - Conv'); grid on;
xlabel("Sequence"); ylabel("Signal Amplitube"); xlim([-10 20]);