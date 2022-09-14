clc; clear all; close all;

fs = 8000;      %sampling frequency

xx1 = importdata("signal_01.mat");

XX1 = fft(xx1);

L1 = length(xx1);

%ampltude of the frequency components
P1 = abs(XX1/L1);
P11 = P1(1:L1/2+1);
P11(2:end-1) = 2*P11(2:end-1); 

f1 = (fs*(0:(L1/2))/L1);

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

xx2 = importdata("signal_02.mat");

XX2 = fft(xx2);

L2 = length(xx2);

%ampltude of the frequency components
P2 = abs(XX2/L2);
P12 = P2(1:L2/2+1);
P12(2:end-1) = 2*P12(2:end-1); 

f2 = (fs*(0:(L2/2))/L2);

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

[b,a]=butter(3,[200,500]/(fs/2),'bandpass');
xxf = filter(b, a, xx2);

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

XXf = fft(xxf);

Lf = length(xxf);

%ampltude of the frequency components
Pf = abs(XXf/Lf);
P1f = Pf(1:Lf/2+1);
P1f(2:end-1) = 2*P1f(2:end-1); 

ff = (fs*(0:(Lf/2))/Lf);

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%plot the frequency spectrum
subplot(3,1,1);
plot(f1,P11) 
title('Single-Sided Amplitude Spectrum of a Signal')
xlabel('f (Hz)')
ylabel('Amplitude')
grid on

subplot(3,1,2);
plot(f2,P12) 
title('Single-Sided Amplitude Spectrum of a Signal (with noise)')
xlabel('f (Hz)')
ylabel('Amplitude')
grid on

subplot(3,1,3);
plot(ff,P1f) 
title('Single-Sided Amplitude Spectrum of a Signal (filtered signal)')
xlabel('f (Hz)')
ylabel('Amplitude')
grid on

pause;

sound(xx1);
pause;

sound(xx2);
pause;

sound(xxf);
pause;