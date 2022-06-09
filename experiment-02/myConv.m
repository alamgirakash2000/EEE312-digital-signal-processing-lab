clc; clear; close all;
format compact;

% Defining signals
x1 = [4 2 6 1 8 5];      % signal 01
x2 = [3 8 -5 -6 9 6 7];        % signal 02

% Doing convolution
result_builtIn = conv (x1 ,x2)
result_defined = myConvo(x1, x2)

function [y] = myConvo(x1, x2)
% Defining function to convolute two signals
n = length(x1)+length(x2)-1;      % Length of the result
yf = zeros(1,n);                  % Defining result signal as zeros
x3 = fliplr(x2);                  % Flip one signal for x(m-n) operation
% Defining two signal's length for shifting operations
y1 = zeros(1,n);                  
y2 = y1;
y1(1:length(x3))= x3;            % Assiging flipped signal into defined one
y2(length(x3):n) = x1;           % Assigning 1st signal into the defiend signal

% Calculating convolution
for i=1:n
    yf(i) = sum(rightShift(y1,i).*y2);
end
y = yf;
end

 
function  [y] = rightShift(x,n0)
% Function for shifting operation
n = length(x);
y1 = zeros(1,n+n0);
y1((n0:n+n0-1)) =x;
y = y1(1:n);
end
 
 