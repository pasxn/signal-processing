clc; clear all; close all;

fs = 8000;
ts = 1/fs;

nTs = 0:ts:2;
n = 0:2/ts;

x_t = sin(2*pi*440*nTs);

x_t_n = x_t + sin(2*pi*1500*nTs);

Wn = 800/(fs/2);

[z, p] = butter(5, Wn, 'low');

x_t_f = filter(z, p, x_t_n);

sound(x_t_f);