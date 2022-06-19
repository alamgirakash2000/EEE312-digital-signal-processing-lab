clc; clear; close all;
format compact;

% Defining signals
x1 = [2 0 1 2 1 2];            % signal 01
x2 = [1 2];        % signal 02

% Doing convolution
[result_builtIn, lag ]= xcorr (x1 ,x2);
[result_defined, lag2]= myXcorr(x1, x2);

subplot(211), plot(lag, result_builtIn,'Linewidth',2), title('BuiltIn')
subplot(212), plot(lag2, result_defined,'Linewidth',2), title('Defined')
