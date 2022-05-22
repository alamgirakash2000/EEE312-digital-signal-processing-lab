%% Sampling and reconstruction of the signal -
%% y = sin(2*pi*10*t) + sin(2*pi*50*t) + sin(2*pi*100*t)

clear; clc; close all;

%% Sampling and Reconstruct using different sampling rates 

sample_rates = [10, 50, 100, 200];     % Sampling rates
fig_count = 0;

for i = sample_rates
    % Defining parameters
    Fs = i;              % sampling rate
    Ts = 1/Fs;           % sampling period
    
    % generating continous and sampled signals
    tc = 0: 1e-4 : 0.5;                 % continuous time axis
    cont_signal = sin(2*pi*10*tc) + sin(2*pi*50*tc) + sin(2*pi*100*tc);   % continuous signal
    
    td = 0: Ts : 0.5;                   % Descrete time axis
    sample_number = length(td);         % number of samples
    des_signal = sin(2*pi*10*td) + sin(2*pi*50*td) + sin(2*pi*100*td);    % Descreate signal
    
    % Reconstructing
    tr = 0: 1e-4 : 0.5;                        % time axis for reconstruction
    recon_signal = interp1(td, des_signal,tr); % reconstructed signals
    
    % plotting of continuous and sampled signal
    fig_count = fig_count + 1;
    figure(fig_count)
    % for continuous
    subplot(3,1,1);
    plot(tc, cont_signal)
    title("Continuous time Signal")
    
    % for sampled signal
    subplot(3,1,2)
    stem(td, des_signal)
    title("Sampled Signal for sample rate of " + Fs + "Hz")
    
    % for recoonstructed signal
    subplot(3,1,3);
    plot(tr, recon_signal);
    title("Reconstructed Signal from the sampled signal of " + Fs +"Hz")
end



