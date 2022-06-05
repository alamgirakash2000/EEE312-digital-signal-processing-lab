function [s,x] = ramp(lag, lowerLimit, upperLimit)
x= lowerLimit:upperLimit;
s = zeros(1, length(x));
for i = 1:length(x)
    if(x(i)-lag>0)
        s(i) = x(i)-lag;
    end
end
end