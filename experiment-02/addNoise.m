function [corruptedSignal, noise] = addNoise(x,SNR)
%Generating white noise for SNR(DB)
Px = sum(x.^2)/length(x);
Py = Px / (10^(SNR/10));
noise = sqrt(Py)*randn(1, length(x));

%Generate Corrupted input
corruptedSignal = noise+x;
end