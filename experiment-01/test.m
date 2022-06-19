clear; clc; close all;
format compact;

%%Defifning variables
F = 20;                         % Frequency of continuous Signal 
tc = 0: 1e-4 : 0.3;              % continuous time axis
cont_signal = sin(2*pi*10*tc) + sin(2*pi*50*tc) + sin(2*pi*100*tc);   % continuous signal
subplot(311); plot(tc, cont_signal); title("Continuous Signal");

%%Sampling
Fs = 400;                        % Descreate time frequency
Ts = 1/Fs;
td = 0:Ts:0.3;                  % Descrete time axis
sampledSignal = sin(2*pi*10*td) + sin(2*pi*50*td) + sin(2*pi*100*td);
subplot(312); stem(td, sampledSignal, "Filled"); title("Sampled signal");

%%Quantization
bits = 4;
quantizedSignal = sampledToQuantize(sampledSignal, bits);
subplot(313); stairs(td, quantizedSignal); title("Quantize signal");

%%Encoding
encoded = quantizedToEncoded(quantizedSignal, bits)

