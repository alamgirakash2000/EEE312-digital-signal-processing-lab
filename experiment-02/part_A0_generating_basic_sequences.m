%% Generating sequences
clc; clear; close all;

x = -3:3;
lag = -1;

% Impulse sequence
impulseSequence = (x - lag) ==0;
subplot(311); stem(x, impulseSequence); title("Impulse Sequence")

% Unit step sequences
unitStep = (x-lag) >=0;
subplot(312); stem(x, unitStep); title("Unit Step Sequence")

% Ramp sequence
ramp = zeros(1, length(x));
ramp((x-lag)>=0) = (x -2);