clc; clear; close all;
format compact;

% Declare Numerator and Denumerator of the Impulse response
num = [1 0 0]; den = [1 -1/2 -1/2];

[h,n] = impz(num,den);      % impulse response                           
stem(n,h,'Linewidth',2);grid on;title('Impulse Response of the fucntion');
K = SchurCohn(den); % Stability Test

function [K] = SchurCohn(A)
%%SchurCohn Test Function
L = length(A);
K = zeros(1,L);
stability = 1;
for i = 1:L
    K(L-i+1)=A(end);
    if abs(K(L-i+1))>1
        disp('Unstabale System');
        stability = 0;
        break;
    end
    A = (A - K(L-i+1)*fliplr(A))/(1-K(L-i+1)^2);
    A(end)=[];
end
if stability == 1
    disp('Stable System');
end
end
