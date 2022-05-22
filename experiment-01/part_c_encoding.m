%% Encoding of a Quantized sequence
clear; clc; close all;
format compact;

%% Sampling of the continuous function
Fs = 200;                           % sampling rate
Ts = 1/Fs;                          % sampling period
tc = 0: 1e-4 : 0.3;                 % continuous time axis
td = 0: Ts : 0.3;                   % Descrete time axis
cont_signal = sin(2*pi*10*tc) + sin(2*pi*50*tc) + sin(2*pi*100*tc);   % continuous signal
samp_signal = sin(2*pi*10*td) + sin(2*pi*50*td) + sin(2*pi*100*td);   % sampled signal
normalizedSignal = samp_signal / (max(samp_signal)- min(samp_signal));

%% Quantization of a sampled function
nbits = 3;
nLevel = 2^nbits -1 ;                                           % number of level
qLevels = linspace(min(samp_signal),max(samp_signal),nLevel) ;  % Quantized level
scalingFactor = normalizedSignal * (nLevel - 1);                % scalling factor for the quantized sequence
quant_signal = round(scalingFactor)*(max(samp_signal) - min(samp_signal))/(nLevel-1) ;

%% Encoding
len = length(td);
encodedSignal(len) =0;
for j=1:len
    for i = 1:length(qLevels)
        if(abs(quant_signal(j) - qLevels(i)) < 10^-4)
            encodedSignal(j) = i;
            break;
        end
    end
end

binary_encodedSignal = dec2bin(encodedSignal);
disp(binary_encodedSignal)