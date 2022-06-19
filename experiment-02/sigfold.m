function [y,n]= sigfold (x,n)
% For signal folding
y= fliplr (x);
n=- fliplr (n);
end