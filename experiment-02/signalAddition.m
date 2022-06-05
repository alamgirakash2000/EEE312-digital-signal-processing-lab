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