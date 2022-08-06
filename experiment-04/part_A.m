clc ;clear; close all;
format compact;

% Variables
Fs = 200e3;
dt = 1 / Fs;

% Rectangular Pulse Train
PulseTrainPeriod = 1e-3;
DutyCycle = .1;
PulseWidth = DutyCycle * PulseTrainPeriod;
freqAnalog = 1/PulseTrainPeriod;
timeInterval = -PulseTrainPeriod / 2 : dt : PulseTrainPeriod / 2;
n = timeInterval / dt;
L = PulseWidth / dt;
RectangularPulse = zeros(1, length(timeInterval));
RectangularPulse(abs(n) <= L / 2) = 1.1;
% END OF RECTANGULAR PULSE TRAIN

N = length(RectangularPulse);
Nc = [0.03 * N,0.05*N, 0.1 * N, 0.15*N, 0.2*N,0.25*N, 0.3*N,0.35*N,0.4*N,0.45*N,N];
MSE = zeros(1, length(Nc));

figure(1)
for p = 1 : length(Nc)
    NcTemp = Nc(p);
    if ~(mod(NcTemp, 2))
        k = -NcTemp / 2 : NcTemp / 2 - 1;
    else
        k = -(NcTemp - 1) / 2 : (NcTemp + 1) / 2;
    end
    
    c = zeros(1, length(k));
    for j1 = 1 : length(k)
        for j2 = 1 : length(RectangularPulse)
            c(j1) = c(j1) + 1 / N * RectangularPulse(j2) * exp(-1i * 2 * pi * k(j1) * n(j2) / N);
        end
    end
    
    tRemax = PulseTrainPeriod / 2;
    tR = -tRemax : dt : tRemax;
    nR = tR / dt;
    xR = zeros(1, length(nR));
    for j1 = 1 : length(k)
        for j2 = 1 : length(xR)
            xR(j2) = xR(j2) + c(j1) * exp(1i * 2 * pi * k(j1) * nR(j2) / N);
        end
    end
    plot(tR, xR);hold on;
    MSE(p) = mean((RectangularPulse - xR) .^ 2);
end

legend('Nc=0.03N','Nc=0.1N','Nc=0.15N','Nc=0.2N', 'Nc=0.25N', 'Nc=0.3N', 'Nc=0.35N', 'Nc=0.4N','Nc=0.45N','Nc=N');
xlabel('t', 'linewidth', 14);
ylabel('x_{reconstructed}', 'linewidth', 14);
title('Reconstructed signal', 'linewidth', 14);
figure(2)
plot(Nc/N, MSE, 'linewidth', 2);
xlabel('N_{c}/N', 'linewidth', 14);
ylabel('Mean square error(MSE)', 'linewidth', 14);
title("MSE vs Total no. of coefficient", 'linewidth', 14);