clc; clear;close all;
format compact;

% Variables
X1 = [2 3 4];
n1 = 0:2;
X2 = [3 4 5 6];
n2 = 0:3;

% Using Convolution sum
[result, xResult]= conv_m(X1,n1, X2,n2);
subplot(211),stem(xResult,result,'Linewidth',3), title("Convolution Sum");
xlabel("n"), ylabel("y(n)");

% Theoritical Value
kmin = n1(1) + n2(1); kmax = n1(end) + n2(end);
k = kmin : kmax;
x1 = [zeros(1, n1(1) - k(1)), X1, zeros(1, k(end) - n1(end))];
x2 = [zeros(1, n2(1) - k(1)), X2, zeros(1, k(end) - n2(end))];
z =zeros(1,length(k));
for i =1:kmax+1
    g = x1(i)*x2;
    z = z + [zeros(1,i-1) g(1:(length(g)-i+1))];
end
subplot(212),stem(k,z,'Linewidth',3);grid on;title('Theoritical Approach');
xlabel("n"), ylabel("y(n)");
function [y,ny]=conv_m(x, nx, h, nh)
nyb = nx(1)+nh(1);
nye = nx(length(x))+nh(length(h));
ny = nyb:nye;
y = conv(x,h);
end