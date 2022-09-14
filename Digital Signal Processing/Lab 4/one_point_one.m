clc; clear all; close all;

xx = importdata("signal_01.mat");

sound(xx);
pause(2);

fs = 8000;      %sampling frequency
% t = 0:1/fs:5;   %time vector
% 
% %time domain signal
% xx = 0.8*sin(2*pi*1000*t) + 0.6*sin(2*pi*1500*t) + 0.4*sin(2*pi*2200*t) + 1*sin(2*pi*3000*t);

%performing fourier transform using 'fft' command
XX = fft(xx);

L = length(xx);

%ampltude of the frequency components
P = abs(XX/L);
P1 = P(1:L/2+1);
P1(2:end-1) = 2*P1(2:end-1); 

f = fs*(0:(L/2))/L;

%plot the frequency spectrum
figure('Name','Frequency Spectrum')
plot(f,P1) 
title('Single-Sided Amplitude Spectrum of a Signal')
xlabel('f (Hz)')
ylabel('Amplitude')
grid on