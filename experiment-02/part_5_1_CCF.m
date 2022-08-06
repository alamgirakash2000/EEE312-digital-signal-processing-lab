clc; clear; close all;
format compact;

x1 = [0 ,1 ,1 ,3 ,5 ,7 ,2 ,0];
n1 = -2:5;

x2 = [0 ,5 ,5 ,5 ,3 ,3 ,1 ,1 ,0];
n2 = -6:2;

[l , y ] = CCF ( x1 , n1 , x2 , n2 ) ;

subplot (211) ; stem (l ,y ,'filled') ; title ('CCF ') , xlabel ('lags l') ;

% Calculating cross - correlation with xcorr
subplot (212) ;
[y , lags ] = xcorr ( x1 , x2 ) ;
stem ( lags , y ,'filled') ; title ('CCF using xcorr () for verification ') ,xlabel ('lags l') ;

function [l , y ] = CCF( x1 , n1 , x2 , n2 )
lmin = -(max ( n2 ) - min ( n1 ) ) ;
lmax = max ( n1 ) - min ( n2 ) ;

l = lmin : lmax ;
y = zeros ( size ( l ) ) ;

idx = 1;
for i = l
    [ n2_sft , x2_sft ] = sigshift ( x2 , n2 , i ) ;
    
    n = min( n1 (1) , n2_sft(1) ) :max( n1 (end) , n2_sft (end) ) ;
    temp = zeros (1 , length ( n ) ) ;
    temp2 = temp ;
    
    temp (( n >= n1 (1) ) &( n <= n1 (end ) ) ) = x1 ;
    temp2 (( n >= n2_sft (1) ) &( n <= n2_sft (end) ) ) = x2_sft ;
    
    y ( idx ) = sum( temp .* temp2 ) ;
    idx = idx +1;
end
end