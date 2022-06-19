function [y,lag] = myXcorr(x1, x2)
% Defining function to find cross corelation two signals
l = max(length(x2), length(x1))-1;         % set the limit 
lag = -l:1:l;             % indices of the result
n = length(lag);          % Length of the result
yf = zeros(1,n);          % Defining result signal as zeros

% Defining two signal's length for shifting operations
y1 = zeros(1,n);                  
y2 = y1;
% Assigning signals
y1(1:length(x2))= x2;  
y2(length(x2):(length(x2)+length(x1)-1)) = x1;




% Calculating Cross Corelation
for i=1:n
    yf(i) = sum(rightShift(y1,i).*y2);
end

if max(length(x2), length(x1))== length(x1)
    lg =sum(yf==0);
    [y] = rightShift(yf,lg+1);
else
    y = yf;
end

end

 
function  [y] = rightShift(x,n0)
% Function for shifting operation
n = length(x);
y1 = zeros(1,n+n0);
y1((n0:n+n0-1)) =x;
y = y1(1:n);
end