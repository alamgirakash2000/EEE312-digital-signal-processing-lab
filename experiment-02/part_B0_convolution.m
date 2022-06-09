%% PART B example: Convolution sum
clc; clear; close all;
format compact;

% Defining variables and needed parameters
x1 = [4 2 6 3 8 1 5];      % signal 01
n1 = -2:4;                 % index for signal 01
x2 = [3 8 6 9 6 7];        % signal 02
n2 = -4:1;                 % index for signal 02
kmin = n1(1)+n2(1);        % left edge of convolved result
kmax = n1(end)+n2(end);    % Right edge of the convolved result

% Doing convolution
y = conv(x1, x2);          % getting convolved result
k = kmin:kmax;             % generating index of the result

% Plotting the results
subplot (311) ,stem (n1,x1 ,"filled"), title ("x_1 (n)"); xlabel ("n"); ylabel ("x_1");
subplot (312) ,stem (n2,x2 ,"filled"), title ("x_2 (n)"); xlabel ("n"); ylabel ("x_1");
subplot (313) ,stem (k,y,"filled"), title ("x(n) = x_1(n) * x_2(n) ");
xlabel ("n"); ylabel ("x");