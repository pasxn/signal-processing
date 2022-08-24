clc; clear all; close all;

fs = 8000;
ts = 1/fs;

nTs = 0:ts:2;

x_t = sin(2*pi*440*nTs);

sound(x_t);

pause;

x_t_n = x_t + sin(2*pi*1500*nTs);

sound(x_t_n);