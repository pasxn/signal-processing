function [Dn, Dnmag, Dnangle, fbins, Fs]=calculateCn(file, N, T0)
% [Dn, Dnmag, Dnangle, fbins, Fs]=calculateCn(file, N, T0)
% This function will compute the N-point DFT and convert it to the fourier
% series coefficients. The file should contain a single note.
% file: a WAV file containg one time cycle of the waveform (chord)
% N: number of DFT bins
% T0: the  period of the wave contained in "file"; may not necesarily be
% the fundamental period.
% Dn: fourier series coefficients in complex form
% Dnmag: single sided fourier coefficient magnitudes
% Dnangle: single sided fourier coefficient angles
% fbins: frequency bins related to 'n'
% Fs: sampling frequency of the original music file
% example:
%    [Dn, Dnmag, Dnangle, fbins, Fs]=calculateCn('guitar.wav',1024,3.81);
% ECK 31/08/2016

[g,Fs]=audioread(file);
t=[1:round(length(g)/N):length(g)];
g=g(t);

Dn=(1/N)*fft(g); 
Dn=2*Dn(1:N/2);
Dn(1)=Dn(1)/2;
[Dnangle,Dnmag]=cart2pol(real(Dn),imag(Dn)); 
fbins=[0:length(Dn)-1]/T0;
