clc; clear; close all;
format compact;

%%Defining variables and signals
N = 50;
n = 0:(N-1);
x = 2*n.*0.9.^n;       % main signal
d = rand(1,N) - 0.5;   % noise
y = x+d;               % signal with noise

% Plotting the Original signal with noise
subplot(311); plot(n,x,"-."); title("Noisy Signal"); hold on;
plot(n,y);
legend("x(n)","y(n)")

% Smoothing by MA system
M =3;
z = zeros(1, length(n));
z (1:( M -1) ) = y (1:( M -1) ) / M ;
for i= M:length(n)
    sig = y(i);
    for j = 1:M-1
        sig = sig + y(i-j);
    end
    z(i) = sig/M;
end

% Plotting the Original signal with smoothed signal
subplot(312); plot(n,x,"-."); title("Smoothed Signal"); hold on;
plot(n,z);
legend("x(n)","z(n)")

% Calculating Normalized Error
e= abs((x-z)./x) ;
subplot(313); plot(n, e); title("Normalized Error");


