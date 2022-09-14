clc; clear all; close all;

fs = 8000;
ts = 1/fs;

nTs = 0:ts:2;

x_t = 0.8*sin(2*pi*200*nTs) + sin(2*pi*880*nTs);

Wn = 1600/(fs/2);   

[z, p, k] = butter(6, Wn, 'high');

sos = zp2sos(z,p,k);
fvtool(sos,'Analysis','freq');