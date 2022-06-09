clc; clear; close all;

%encoding the signal
decimal=zeros(1,length(quantizedsig));
for n=1:length(quantizedsig)
    [x,position]=min(abs(quantizedsig(n)*ones(1,length(levelamplitudes))-levelamplitudes));
    decimal(n)=position-1;
end
encoded=dec2bin(decimal);
encoded=encoded';
encoded_vector=encoded(:);
fprintf('encoded signal for %d bit quantization \n',bit(m));
encoded_vector'
