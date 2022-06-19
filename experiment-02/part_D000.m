clc; clear; close all;
format compact;

%%Defining variables
T = 2e-3;   % Period = 2ms
tstep = T/100;
t = tstep:tstep:3*T; % Taking time index upto 3 periods
x = 2*sin(2*pi*t/T);  % Input

%%Generate Corrupted input with -10 db
[y,n] = addNoise(x,-10);

%%Normalizing signals after finding the Auto correlation
ACF_x = normalize(xcorr(x));
ACF_n = normalize(xcorr(n));
ACF_y = normalize(xcorr(y));
ACF_y(length(x))= 0.4*max(ACF_y); 

%%PLotting the outputs
figure(1)
subplot(211); plot(t,x); title("Input signal");
subplot(212); plot(t,n);title("Noise signal");
figure(2)
subplot(221); plot(ACF_x); title("Input signal");
subplot(222); plot(ACF_y);title("Noise signal");





%%Defining normalize function
function R = normalize(x)
R = x/max(x);
end
