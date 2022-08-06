%%Designing an Up-sampler
clc; clear; close all;
format compact;

% Define variables
n = 1:52;            % sequence
L = 3;               % Up-sampling factor
x =sin(0.36*n);      % Function that will be up-sampled
y = upsampler(x, L);

% Plotting signals
subplot(211); stem(n,x,"filled", "b"); title("x(n)")
subplot(212); stem(y(n),"filled", "r"); title("y(n) = x(n/L), L = "+L)

% Defining function to up-sampling
function [y] = upsampler(x,L)
len = length(x) + (length(x) - 1)*(L-1);
y = zeros(1, len);
for i =1:len
    if( round(i/L)-(i/L)==0)
        y(i) = x(i/L);
    end
end
end