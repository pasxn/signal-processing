% This document was made based on online resources.
clear all
clc

A1 = 1;
fm1 = 20; %Hz
Fs = 1000; %Hz 
Ts = 1/Fs;
t = 0:Ts:(1-Ts);
m_t = A1*cos(2*pi*fm1*t); 
figure(1);
subplot(4,2,1);
plot(t,m_t, 'b-');
title('Message signal');

[FT_spec,freq_axis] = centeredFFT(m_t,Fs);
subplot(4,2,2)
stem(freq_axis, abs(FT_spec));
title('Spectrum of the message signal');
axis([-(fm1+5) (fm1+5) 0 1]);

%Carrier signal
Ac = 1;
fc = 150; %Hz
Tc = 1/fc;
x_c = Ac*cos(2*pi*fc*t);
subplot(4,2,3);
plot(t, x_c, 'b-');
title('Carrier signal');

[FT_spec,freq_axis] = centeredFFT(x_c,Fs);
subplot(4,2,4)
stem(freq_axis, abs(FT_spec));
axis([-(fc+5) (fc+5) 0 1])
title('Spectrum of the carrier')

%DSB-SC Modulation
x_DSB = m_t.*x_c;
subplot(4,2,5);
plot(t,x_DSB);
title ('DSB-SC Modulated signal')

[FT_spec,freq_axis] = centeredFFT(x_DSB,Fs);
subplot(4,2,6)
stem(freq_axis, abs(FT_spec));
axis([-(fc+fm1+5) +(fc+fm1+5) 0 0.3])
title ('Spectrum of the DSB-SC signal')

% DSB Demodulation
phi_0 = 0.3*pi;
x_c1  = Ac*cos(2*pi*fc*t+phi_0);
x_demod_temp = x_DSB.*x_c1*2;
win_length = 10;
f_cut = fm1+10 ; %Cut-off frquency
LPF_ed = myLPF(f_cut, Fs, x_demod_temp, win_length);
subplot(4,2,7);
plot(t, LPF_ed, 'r-'); %There is a non-ideal part (time-shift, etc) caused by digital filtering
axis([0 1 -A1 A1])
title('Demodulated signal (recovering m(t))');