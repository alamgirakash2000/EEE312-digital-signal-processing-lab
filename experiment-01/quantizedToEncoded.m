function [y] = quantizedToEncoded(quantizedSignal, bits)
DEL = (max(quantizedSignal)-min(quantizedSignal))/(2^bits -1);
coded = round(quantizedSignal - min(quantizedSignal))/DEL;
y = dec2bin(coded);
end