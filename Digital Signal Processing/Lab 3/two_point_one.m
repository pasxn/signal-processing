clc; clear all; close all;

fs = 8000;
ts = 1/fs;

nTs = 0:ts:2;

x_t = 0.8*sin(2*pi*200*nTs) + sin(2*pi*880*nTs);

Wn = 1600/(fs/2);

[z, p] = butter(6, Wn, 'high');

x_t_f = filter(z, p, x_t);

subplot(2,1,1);
plot(nTs, x_t);
title('Origial signal: x(n)');
xlabel('Time (s)');
ylabel('Amplitude');

subplot(2,1,2);
plot(nTs, x_t_f);
title('Filtered signal: xf(n)');
xlabel('Time (s)');
ylabel('Amplitude');