clc; clear all; close all;

fs = 8000;
ts = 1/fs;

nTs = 0:ts:2;

x_t = sin(2*pi*440*nTs);

x_t_n = x_t + sin(2*pi*1500*nTs);

Wn = 800/(fs/2);

[z, p, k] = butter(5, Wn, 'low');
[sos] = zp2sos(z,p,k);
h = fvtool(sos);