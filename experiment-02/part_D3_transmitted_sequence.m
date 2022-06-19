clc; clear; close all;
format compact;

% Defining variables and generating input signals
L = 50;                % Length of the signals
n = 1:L;               % sequence in length L
x1 = 5*ones(1, 10);    % Positive sequence
x2 = -x1;              % Negative Sequence

% transmitted signal
x = [x1 x2 zeros(1,L-20)]; 
figure(1)
subplot(311); stem(n,x); title("Transmitted Signal");

% Received signal
lag = 20;
receivedSignal = [zeros(1,lag) x zeros(1,(L-20-lag))];
subplot(312); stem(receivedSignal); title("Received Signal");xlim([1,50])

% Adding noise to the received signal
[corruptedSignal,n ]= addNoise(receivedSignal, -5);
subplot(313); stem(corruptedSignal); title("Corrupted received Signal");xlim([1,50])

%%Finding Positive sequence
[ccf1, lag1] = xcorr(corruptedSignal, x1);
figure(2)
subplot(211);stem(lag1, ccf1/max(ccf1)); title("CCF of Received signal and Positive sequence"); 

%%Finding Negative sequence
[ccf2, lag2] = xcorr(corruptedSignal, x2);
subplot(212);stem(lag2, ccf2/max(ccf2)); title("CCF of Received signal and Negative sequence"); 

