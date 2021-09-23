function [magnitude, phase, power, frequency]=powerSpectrum(file)
% function [magnitude, phase, power, frequency]=powerSpectrum(file)
% This function will analyze a waveform in ".wav" format and 
% produce its double sided magnitude and phase spectrum.
% magnitude: This is the magnitude spectrum obtained via FFT
% phase: This is the phase in radians obtained via FFT
% frequency: The frequency bins for the FFT
% file: The name of the wav file eg. 'file.wav'; ensure that the file has
% approximately one time period of the waveform. 
% N: The number of points for the FFT analysis
% example: [m,p,po,f]=powerSpectrum('file.wav');
% ECK/25/08/2016

[y, Fs] = audioread(file); 
M=length(y); % window length
N = pow2(nextpow2(M)); % transform length to a nearest 2 to the power                        
g = fft(y,N); 
g0=fftshift(g); % rearange values for the double sided spectrum
frequency = (-N/2:N/2-1)*Fs/N;
cn = g0/N;  
magnitude=abs(cn);
phase = unwrap(angle(cn));
power = cn.*conj(cn);

% If you need to plot the spectrum, issue the following commands at the
% Matlab command prompt.
% figure(1) % for power spectrum
% plot(frequency/1000,power);grid
% title(['Power spectrum of ' file])
% xlabel('Frequency (KHz)')
% ylabel('Power')

% figure(1) % for magnitude spectrum
% plot(frequency/1000,magnitude);grid
% title(['Magnitude Spectrum of ' file])
% xlabel('Frequency (KHz)')
% ylabel('Magnitude')

figure(2) % magnitude and phase spectrum
subplot(2,1,1)
plot(frequency/1000,magnitude);grid
title(['Magnitude Spectrum of ' file])
xlabel('Frequency (KHz)')
ylabel('Magnitude')

subplot(2,1,2)
plot(frequency/1000, phase);grid
title(['Phase Spectrum of ' file])   
xlabel('Frequency (KHz)')
ylabel('Phase (Radians)')


