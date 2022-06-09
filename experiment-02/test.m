%% Convolution
clc; clear; close all;
format compact;

% Defining variables
x1 = [4 2 6 3 8 1 5];      % signal 01
n1 = -2:4;                 % index for signal 01
x2 = [3 8 6 9 6 7];        % signal 02
n2 = -4:1;                 % index for signal 02

% Calling the function to find convolution of two signals
[y, x1 , x2 , n] = conv_m (x1 ,n1 , x2 ,n2);

%  Plotting signals
subplot (311) ,stem (n,x1 ,"filled"), title ("x_1 (n)"); xlabel ("n"); ylabel ("x_1");
subplot (312) ,stem (n,x2 ,"filled"), title ("x_2 (n)"); xlabel ("n"); ylabel ("x_1");
subplot (313) ,stem (n,y,"filled"), title ("x(n) = x_1 (n) * x_2 (n) ");
xlabel ("n"); ylabel ("x");

%function for convolution
function [y, x1_ , x2_ , ny] = conv_m (x1 , n1 , x2 , n2)
ny = (n1(1)+n2(1)) : (n1(end)+n2(end));
x1_ = zeros (1, length (ny));
x2_ = x1_ ;

x1_( (ny >= n1 (1)) & (ny <= n1( end ))) = x1;
x2_ ((ny >= n2 (1)) & (ny <= n2( end ))) = x2;

 y = conv (x1 ,x2);
 end