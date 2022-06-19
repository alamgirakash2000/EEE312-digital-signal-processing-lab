function [quantizedSignal]=sampledToQuantize(sampledSignal, bits)
DEL = (max(sampledSignal)-min(sampledSignal))/(2^bits -1);
levels =  min(sampledSignal): DEL: max(sampledSignal);
y= zeros(1,length(sampledSignal));
for i= 1:length(y)
    for j = 1:length(levels)
        if(abs(sampledSignal(i) - levels(j))<(DEL/2))
            y(i) = levels(j);
        end
    end
end
quantizedSignal = y;

% Calculating SQNR
errorPower = sum((quantizedSignal-sampledSignal).^2)/length(quantizedSignal);
signalPower = sum(sampledSignal.^2)/length(sampledSignal);
SQNR_calc = 10*log10(signalPower/errorPower);
SQNR_theory = 1.76 + 6*bits;
fprintf("Calculated SQNR: %.2f \n",SQNR_calc);
fprintf("SQNR from theory: %.2f \n", SQNR_theory);
end