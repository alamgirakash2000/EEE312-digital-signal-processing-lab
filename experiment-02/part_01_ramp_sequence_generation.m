close all; clear; clc;
format compact;

% Generating  ramp signal;
lag = 2;                                % defining the lag
[n_ramp, x_ramp] = ramp(lag, -10,10);   % generate ramp signal
stem(x_ramp, n_ramp);                   % plotting the signal
grid on;
title("Ramp signal with lag: "+lag);
xlabel('n')
ylabel('ramp(n)')

% Defining ramp function to generate the ramp signal
function [s,x] = ramp(lag, lowerLimit, upperLimit)
x= lowerLimit:upperLimit;
s = zeros(1, length(x));
for i = 1:length(x)
    if(x(i)-lag>0)
        s(i) = x(i)-lag;
    end
end
end