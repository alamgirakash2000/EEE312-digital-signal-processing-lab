clc; clear; close all;
format compact;

% Addition of two different signal x1 and x2
n1 = 0:5;               % time axis for signal 01
x1 = [0,1,2,3,6,9];     % signal 01
n2 = -1:2;              % time axis for signal 02
x2 = [0,1,2,3];         % signal 02

% Add two signal by defiend function
[x,n]= sigadd(x1,n1,x2,n2);

%plotting added signal
subplot(311); stem(n1,x1); title("X_1"); xlabel("n_1"); ylabel("X_1(n)");
subplot(312); stem(n2,x2); title("X_2"); xlabel("n_2"); ylabel("X_2(n)");
subplot(313); stem(n,x); title("Result: X = X_1 + X_2"); xlabel("n"); ylabel("X(n)");


function [x, n] = sigadd(x1,n1,x2,n2)
n= min (n1(1) ,n2(1)):max(n1(end),n2(end )); % Dimension for added signal
% Initializing two signal for replicating the signal
y1 = zeros(1, length(n));        
y2=y1;

% replicating signal x1 and x2 to y1 and y2 accordingly
y1((find(n==n1(1)):find(n==n1(end)))) = x1;
y2((find(n==n2(1)):find(n==n2(end)))) = x2;

% Addition of the replicated signals
x= y1+y2;
end