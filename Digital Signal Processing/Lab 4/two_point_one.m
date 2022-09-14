clc; clear all; close all;

xx1 = importdata("signal_01.mat");

fs = 8000;      %sampling frequency

XX1 = fft(xx1);

L1 = length(xx1);

%ampltude of the frequency components
P1 = abs(XX1/L1);
P11 = P1(1:L1/2+1);
P11(2:end-1) = 2*P11(2:end-1); 

f1 = (fs*(0:(L1/2))/L1);

xx2 = importdata("signal_02.mat");

XX2 = fft(xx2);

L2 = length(xx2);

%ampltude of the frequency components
P2 = abs(XX2/L2);
P12 = P2(1:L2/2+1);
P12(2:end-1) = 2*P12(2:end-1); 

f2 = (fs*(0:(L2/2))/L2);

%plot the frequency spectrum
subplot(2,1,1);
plot(f1,P11) 
title('Single-Sided Amplitude Spectrum of a Signal')
xlabel('f (Hz)')
ylabel('Amplitude')
grid on

subplot(2,1,2);
plot(f2,P12) 
title('Single-Sided Amplitude Spectrum of a Signal (with noise)')
xlabel('f (Hz)')
ylabel('Amplitude')
grid on