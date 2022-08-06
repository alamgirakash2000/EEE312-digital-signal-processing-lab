clc; clear; close all;
format compact;

syms z;

Hz = 1/((1-z^-1)*(1-0.5*z^-1));

iztrans(Hz)