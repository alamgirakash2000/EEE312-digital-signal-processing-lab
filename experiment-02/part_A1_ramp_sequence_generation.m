close all; clear; clc;
format compact;

% Generating  ramp signal;
lag = 2;                                % defining the lag
[n_ramp, x_ramp] = ramp(lag, -10,10);   % generate ramp signal from defined function

% plotting the signal
stem(x_ramp, n_ramp,"filled"); grid on; title("Ramp signal with lag: "+lag);               
xlabel('n'); ylabel('ramp(n)');