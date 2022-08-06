clc; clear;close all;
%%Input Array

m_array = [.6,0.3,0.4,0.8,1.6,2.3,3,2.8,2.7,2.1,0.8,-0.7,-2,-2.5,-2.55,-2.58,-2.59,-2.7,-2.8,-2,0,1,0,-1,-1.5,-2.5];


%%Generating Analog Signal from the Array
t_initial = 0:(length(m_array)-1);
t_array = t_initial.*0.1; % assuming sampling rate of array was 10 Hz
t_interp = linspace(0,t_array(end),1001);
m_interp = interp1(t_array,m_array, t_interp,'spline');

Fs = 20; % in Hz

Ts = 1/Fs;
t_sample = linspace(0,t_array(end),(Fs*t_array(end))+1);
m_sample = interp1(t_interp,m_interp, t_sample);

subplot(3,5,[6:7])
stem(t_sample, m_sample)
title('Sampled Signal m(nT_s)')
xlabel('Time (second)')

subplot(3,5,[1:2])
plot(t_interp, m_interp)
title('Message Signal m(t)')
xlabel('Time (second)')