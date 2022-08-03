clc; clear all; close all;

res = 0.001;

t = (0: res: 5);

x_t = cos(8*pi*t);

plot(t, x_t);
xlabel("t");
ylabel("x_t");