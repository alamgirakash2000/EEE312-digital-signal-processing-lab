N = 50; % Number of points
nr = 0:( N -1) ; % index
ny = nr ;

r = randn (1 , N ) ; % white noise
y = zeros ( size ( r ) ) ; % output array

% System output for white noise
for i = 4: N
    y ( i ) = r ( i ) - 0.6* y (i -1) - 0.8* y (i -2) - 0.4* y (i -3) ;
end

rr = fliplr ( r ) ; nrr = -fliplr ( nr ) ;
Ryr = conv (y , rr ) ; % Calculating cross correlation

kmin = ny (1) + nrr (1) ;
kmax = ny ( length ( ny ) ) + nrr ( length ( nrr ) ) ;
k = kmin : kmax ; % generating index
k = find ( k ==0) : length ( k ) ;

subplot (211) , stem (0: length ( k ) -1 , Ryr ( k ) /max ( Ryr ) , 'filled') ;
title ('Approximate Impulse Response ') ; xlabel ('n') ;

% Impulse response using filter
num = [1 0];
den = [1 0.6 0.8 0.4];

n = 0:( N -1) ;
x = zeros ( size ( n ) ) ; x (1) = 1; yy = filter ( num , den , x ) ;
subplot (212);stem (n , yy ,'filled');
title('Actual Impulse Response ');xlabel ('n');
