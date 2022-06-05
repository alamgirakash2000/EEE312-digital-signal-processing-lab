clc; clear; close all;
format compact;

% Finding odd and even part of a signal
% Defining the ramp signal with zero lag
[rampSignal , rampSequence] = ramp (0 , -10 ,10);

% calling the defined function
[odd , n_odd , even , n_even ] = odd_even_part (rampSignal , rampSequence);
% getting back the original signal by adding odd and even part
[x , n ] = signalAddition(n_odd, odd, n_even, even );

% Plotting results
subplot (311); stem(odd , n_odd , "filled"); title("odd part x_o (n)");
xlabel ("n"); ylabel ("x_0");
subplot (312); stem(even , n_even , "filled"); title ("even part x_e (n)");
xlabel ("n"); ylabel ("x_e ");
subplot (313) ; stem (n,x, "filled"); title ("x_o + x_e = x"); 
xlabel ("n"); ylabel ("x");

% Defining the function to finding odd and even part
function [odd , n_odd , even , n_even ] = odd_even_part (x, n)
[n_fold , x_fold ] = sigfold (x,n);
[n_even , even ] = signalAddition(x/2, n, x_fold /2, n_fold );
[n_odd , odd] = signalAddition(x/2, n, -x_fold /2, n_fold );
end


function [n, y]= sigfold (x,n)
% For signal folding
y= fliplr (x);
n=- fliplr (n);
end