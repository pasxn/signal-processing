clc;
clear all;

Fs = 1000; %Hz 
Ts = 1/Fs;
t = 0:Ts:(1-Ts);

fm = 5;
fc = 100;

mt = cos(2*pi*fm*t);

%modulation
ct = cos(2*pi*fc*t);
xt = mt.*ct;

%demodulation
delta_f = 0;
lt = cos(2*pi*(fc + delta_f)*t);
et = xt.*lt;

%lpf
vt = myLPF(15, Fs, et, 10);

subplot(5,1,1);
plot(t, mt);
title('mt');

subplot(5,1,2);
plot(t, ct);
title('ct');

subplot(5,1,3);
plot(t, xt);
title('xt');

subplot(5,1,4);
plot(t, et);
title('et');

subplot(5,1,5);
plot(t, vt);
title('vt');