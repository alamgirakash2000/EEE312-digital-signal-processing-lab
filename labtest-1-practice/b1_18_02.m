clc; clear; close all;
format compact;

% Defining variables
n = -20:20;
lag  = 0;
x = n-lag ==0;    % Impulse signal
subplot(311), stem(n,x); title("Impulse Signal x(n)");

% Using Iterative process
y = zeros(1,length(x));
for i = 3:length(x)
    y(i) = - 0.1*y(i-1) + x(i)*x(i-2)+0.25*x(i-1);
end
subplot(312), stem(n,y); title("Impulse Response y(n)");

% Varify by filter method
a  = [1 0.1]; b =[0 0.25];
res =  filter(b,a,x);
subplot(313), stem(n,res); title("Impulse Response y(n) from filter");

