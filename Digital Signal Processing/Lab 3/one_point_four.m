clc; clear all; close all;

fs = 8000;
ts = 1/fs;

nTs = 0:ts:2;

x_t = sin(2*pi*440*nTs);

x_t_n = x_t + sin(2*pi*1500*nTs);

Wn = 800/(fs/2);

[z, p] = butter(5, Wn, 'low');

x_t_f = filter(z, p, x_t_n);

subplot(3,1,1);
plot(nTs, x_t);
title('Origial signal: x(n)');
xlabel('Time (s)');
ylabel('Amplitude');

subplot(3,1,2);
plot(nTs, x_t_n);
title('Corrupted signal: xn(n)');
xlabel('Time (s)');
ylabel('Amplitude');

subplot(3,1,3);
plot(nTs, x_t_f);
title('Filtered signal: xf(n)');
xlabel('Time (s)');
ylabel('Amplitude');