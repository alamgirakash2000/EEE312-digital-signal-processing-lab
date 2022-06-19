%% Finding odd and even part of a signal
clc; clear; close all;
format compact;

% Defining the ramp signal with zero lag
[rampSignal , rampSequence] = ramp (0 , -10 ,10);

% calling the defined function
[odd , n_odd , even , n_even ] = odd_even_part (rampSignal , rampSequence);
% getting back the original signal by adding odd and even part
[x , n ] = signalAddition(n_odd, odd, n_even, even );

% Plotting results
subplot (311); stem(odd , n_odd , "filled","b"); title("odd part x_o (n)");
xlabel ("n"); ylabel ("x_0"); grid on;
subplot (312); stem(even , n_even , "filled", "r"); title ("even part x_e (n)");
xlabel ("n"); ylabel ("x_e "); grid on;
subplot (313) ; stem (n,x, "filled", "g"); title ("x_o + x_e = x"); 
xlabel ("n"); ylabel ("x"); grid on;


% Defining the function to finding odd and even part
function [odd , n_odd , even , n_even ] = odd_even_part(x, n)
[n_fold , x_fold ] = sigfold (x,n);
[n_even , even ] = signalAddition(x/2, n, x_fold /2, n_fold );
[n_odd , odd] = signalAddition(x/2, n, -x_fold /2, n_fold );
end
