clc; clear; close all;
format compact;

m = [.6,0.3,0.4,0.8,1.6,2.3,3,2.8,2.7,2.1,0.8,-0.7,-2,-2.5,-2.55,-2.58,-2.59,-2.7,-2.8,-2,0,1,0,-1,-1.5,-2.5];
%%Generating Analog Signal from the message signal
%%================================
ti = 0:(length(m)-1);                           % Initial time 
t_message = ti.*0.1;                            % assuming sampling rate of array was 10 Hz
tc = linspace(0,t_message(end),1001);           % Continuous Time
m_interp = interp1(t_message,m, tc,'spline');   % Interpolated message signal

% Sampling Analog message signal with different sample frequency
Fs = 60;                                        % Sampling frequency in Hz
Ts = 1/Fs;                                      % sampling period
ts = linspace(0,t_message(end),(Fs*t_message(end))+1);  % Sampling time
m_sample = interp1(tc,m_interp, ts);            % Sampled message signal
m = m_sample;

%%Finiding best delta 
%%============================
mq = zeros(1,length(m));    % Initializing Quantized message signal
dq = mq;                    % Initializing Modulated signal
d = mq;                     % Initializing Error signal
mq(1) = 0;                  % Assume 1st value is 0

delta = 0:0.1:1;            % Step sizes
best_delta = 0;             % Initial Step size
min_mse = 1;                % Initial MSE loss
for j = 1:length(delta)
    del = delta(j);
    for i = 1:length(m)-1
        d(i) = m(i)-mq(i);
        if d(i) > 0
            dq(i) = del;
        else
            dq(i) = -del;
        end
        mq(i+1) = mq(i)+dq(i);
    end
    MSE = sum((m-mq).^2)/length(m);
    fprintf('For Delta: %.2f Loss is: %f \n',del, MSE);
    % Plotting the signals
    figure();
    plot(ts,m,'Linewidth',2), title(sprintf("Message signal and DM signal at delta: %.2f",del)),xlabel('Time(second)'), grid on;
    hold on;
    stairs(ts,mq,'g','Linewidth',2),legend("m(t)","m_q(t)")
    hold off;
    
    if MSE < min_mse
        min_mse = MSE;
        best_delta = del;
    end
end
fprintf('Best delta: %.2f and Minimum MSE loss is: %f \n',best_delta,min_mse);

%%Generate DM Signal with Minimum MSE Loss
%%=========================================
del = best_delta;                % Step size
for i = 1:length(m)-1
    d(i) = m(i)-mq(i);           % Calculating error
    if d(i) > 0                  % If error is +ve, delta will be added to the previous value
        dq(i) = del;             
    else                
        dq(i) = -del;            % If error is -ve, delta will be subtracted to the previous value
    end
    mq(i+1) = mq(i)+dq(i);      
end


%%Plotting the final results
%%======================================
figure()
subplot(321), plot(tc, m_interp),title("Message Signal: m(t)"), xlabel("Time(second)"), grid on;
subplot(322), stem(ts, m_sample), title(sprintf('Sampled Message signal m(nT) at %d Hz', Fs)), grid on;

subplot(323),plot(ts,m,'Linewidth',2), title(sprintf("Message signal and DM signal at delta: %.2f",del)),xlabel('Time(second)'), grid on;
hold on;
stairs(ts,mq,'g','Linewidth',2),legend("m(t)","m_q(t)")
hold off;

subplot(324),stem(ts,dq,'Linewidth',2), title("Modulated Signal: d_q(t)"),xlabel('Time(second)'), grid on;
subplot(325),stairs(ts,d,'Linewidth',2), title("Error: d(t)"),xlabel('Time(second)'), grid on;


% Calculating Final MSE Loss
MSE = sum((m-mq).^2)/length(m);  % MSE 
fprintf('MSE loss is: %f \n',MSE);


