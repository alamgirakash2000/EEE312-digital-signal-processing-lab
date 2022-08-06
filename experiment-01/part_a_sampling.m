%% Sampling of an analog signal and reconstruction of the sampled signal
clear; clc; close all;

%% Sampling and Reconstruct using different sampling rates 

sample_rates = [20, 50, 100];     % Sampling rates
fig_count = 0;

for i = sample_rates
    % Defining parameters
    F = 10;              % frequency of signal in Hz
    Fs = i;              % sampling rate
    Ts = 1/Fs;           % sampling period
    
    % generating continous and sampled signals
    tc = 0: 1e-4 : 5/F;                 % continuous time axis
    cont_signal = sin(2*pi*F*tc + 0);   % continuous signal
    
    td = 0: Ts :5/F;                    % Descrete time axis
    sample_number = length(td);         % number of samples
    des_signal = sin(2*pi*F*td + 0);    % Descreate signal
    pp = sampledToQuantize(des_signal, 5);
    
    
    % Reconstructing
    tr = 0: 1e-4 : 5/F;                        % time axis for reconstruction
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
    title("Reconstructed Signal from the sampleds signal of " + Fs +"Hz")
end



