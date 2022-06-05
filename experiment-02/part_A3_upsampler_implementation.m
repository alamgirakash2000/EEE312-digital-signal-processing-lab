clc; clear; close all;
format compact;

% Designing an Up-sampler
n = 1:72;
L = 3;               % Up-sampling factor
x =sin(0.36*n);      % Function that will be up-sampled
y = upsampler(x, L);

subplot(211); stem(n,x,"filled"); title("x(n)")
subplot(212); stem(y,"filled"); title("y(n) = x(n/L), L = "+L)

% Defining function to up-sampling
function [y] = upsampler(x,L)
y = zeros(1, length(x));
for i =1:length(x)
    if( round(i/L)-(i/L)==0)
        y(i) = x(i/L);
    end
end
end

function [x, n] = signalAddition(x1,n1,x2,n2)
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