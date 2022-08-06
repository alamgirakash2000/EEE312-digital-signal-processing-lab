clc; clear; close all;
format compact;

% variables
n = -4:4;
unitstep = n>=0;
ramp = n.*unitstep;
[x1,n1]= sigshift(ramp,n,-4);
n1  =n1/2;
subplot(311); plot(n,ramp)
subplot(312); plot(n1,x1)

function [y,n] = sigshift(x,n,s)
n = n+s;
y = x;
end
