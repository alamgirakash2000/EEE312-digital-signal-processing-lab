clc; clear; close all;
format compact;

f_c = 1/8; % DEFINING FREQUENCY VARIABLE FOR SINC PULSE
n = -40:40; % DEFINING THE INDEX FOR SINC PULSE
x = sinc (2* f_c*n); % Generating sinc pulse

figure (1) ; subplot (311)
stem (n, x, '.'); xlabel ('n'), ylabel ('x(n)');
title ('$sinc (2 f_cn )$ pulse ');

M =201; % NUMBER OF POINTS IN DIGITAL FREQUENCY GRID
w_list = {[0 ,2] ,[ -2 ,2]};
for i = 1: length ( w_list )
    w= linspace (2*pi* w_list {i }(1) , 2*pi* w_list {i }(2) , M); % DEFINING THE -DIGITAL FREQUENCY GRID
    dw = w(2) -w(1) ; % RESOLUTION OF DIGITAL FREQUENCY
    X= zeros (1,M); % INITIALIZING THE DTFT OF x(n)
    for i1 =1: M
        for i2 =1: length (x)
            X(i1)=X(i1)+x(i2)*exp (-1i*w(i1)*n(i2));
        end
    end
    figure (1); subplot (3 ,1,i+1) ; plot (w/pi , abs (X));
    xlabel ('Frequency (w/pi) ( rad / sec )'), ylabel ('X(w)');
    
end