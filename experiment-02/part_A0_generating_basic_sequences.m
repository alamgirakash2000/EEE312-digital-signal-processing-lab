clc; clear; close all;
format compact;

%% Generating Impulse sequence
n0 = -2;                % Lag
n = -3:3;               % generating sequence
x1 = [(n-n0)==0];       % using logical argument
subplot(211); stem(n, x1,"filled"); title("Impulse Sequence");

%% Generating unit step sequence
x2 = [(n-n0)>=0];
subplot(212); stem(n, x2,"filled"); title("Unit step Sequence");