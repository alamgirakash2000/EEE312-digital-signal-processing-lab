%% Quantization of a signal and calculate its Quantization Error
clear; clc; close all;
format compact;

%% Sampling of the continuous function
Fs = 200;                           % sampling rate
Ts = 1/Fs;                          % sampling period
tc = 0: 1e-4 : 0.3;                 % continuous time axis
td = 0: Ts : 0.3;                   % Descrete time axis
cont_signal = sin(2*pi*10*tc) + sin(2*pi*50*tc) + sin(2*pi*100*tc);    % continuous signal
samp_signal = sin(2*pi*10*td) + sin(2*pi*50*td) + sin(2*pi*100*td);    % sampled signal
normalizedSignal = samp_signal / (max(samp_signal)- min(samp_signal)); % Normalized signal

%% Quantize the signal by 3 bit uniform quantizer
% Determining number of level
nbits = [3,4,6];
fig_count = 0;
SQNR_list =[]

for bit = nbits
    nLevel = 2^bit -1 ;                                             % number of level
    qLevels = linspace(min(samp_signal),max(samp_signal),nLevel) ;  % Quantized level
    % Scale the signal to have the same magnitude as the number of bits
    scalingFactor = normalizedSignal * (nLevel - 1);                % scalling factor for the quantized sequence
    quant_signal = round(scalingFactor)*(max(samp_signal) - min(samp_signal))/(nLevel-1) ;
    
    % Calculating SQNR
    quant_error = sum((quant_signal - samp_signal).^2)/length(samp_signal);  % mean squared error
    poweredSample = sum(samp_signal.^2) / length(samp_signal) ;
    SQNR = db( poweredSample /quant_error)/2;
    SQNR_list =[SQNR_list, SQNR];
    
    % Reconstruct the original signal by interpolation
    recon_signal = interp1(td, quant_signal, tc);
    
    % plotting of continuous and sampled signal
    fig_count = fig_count + 1;
    figure(fig_count)
    
    % for continuous
    subplot(3,1,1);
    plot(tc, cont_signal)
    title("Continuous time Signal")
    
    % for sampled signal
    subplot(3,1,2)
    stairs(td, quant_signal)
    title("Quantized Signal of " + bit + " bit uniform quantizer")
    
    % for recoonstructed signal
    subplot(3,1,3);
    plot(tc, recon_signal);
    title("Reconstructed Signal from the Quantized Signal of " + bit + " bit uniform quantizer")
    
end