function [x,t]=squareSynthesis(A,fo,NHarmonics, NCycles, Fs, file)
% function [x,t]=squareSynthesis(A,fo,NHarmonics, NCycles, Fs, file)
% This function will synthesize a square wave for a given number of odd
% harmonics
% A: Amplitude of the square wave
% fo: The fundamental frequency of the equare wave
% NHarmonics: the number of harmonics you want to synthesize
% NCycles: The number of cycles you want to see
% Fs: the sampling frequency when saving the waveform
% file: the name of the file the data is saved.
% eg: if you want to synthesize a square waveform with amplitude A=1 and
% fo=500 Hz with 10 harmonics abd produce a waveform for 10 seconds we
% issue the command
% [x,t]=squareSynthesis(1,500,10,5E3,44100,'filename.wav')
% ECK/28/08/2016

t=linspace(0,NCycles/fo,NCycles*Fs/fo);
x(1:length(t))=0;
for n=1:2:2*NHarmonics-1
    cn=A*(1-exp(-i*n*pi))/(i*n*pi);
    x=x+2*abs(cn)*cos(2*pi*n*fo*t+angle(cn));
    plot(t,x);grid;
    St=sprintf('A Square wave upto the %d odd harmonic', (n+1)/2);
    title(St);
    %pause % comment out this if you are not interested in seeing the individual harmonics being added to the signal
end
x_normalized=x/(2*max(x)); % as the amplitide determines the volume, you should
                %normalize the signal to 1 if you intend to play it via the audio card of
                %the computer. 
audiowrite(file,x_normalized,Fs);


