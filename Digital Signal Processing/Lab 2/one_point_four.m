clc; clear all; close all;

n = (0: 0.1: 5);

fs = sqrt(401);
ts = 1/fs;

nT1 = 0:ts:5;
n = 0:5/ts;

x_t = cos(8*pi*nT1);

stem(n, x_t);
xlabel("n");
ylabel("x_n");