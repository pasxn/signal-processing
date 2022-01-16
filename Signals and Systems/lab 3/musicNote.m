function [x,t]=musicNote(fo, duration, Dn, Fs)
% function [x,t]=musicNote(fo,duration,Dn, Fs)
% This function will produce a single note with fundamental frequency fo
% with a given duration based on the fourier coefficients Dn
% example:[x,t]=musicNote(265,2,[1]), this given a signal with fundamental
% frequency of 265Hz, 2 second duration with Dn=[1] (this means only the
% fundamental)
% ECK/29/08/2016

t=linspace(0,duration,duration*Fs);
x(1:length(t))=0;
for i=1:length(Dn)
    x=x+2*abs(Dn(i))*cos(i*2*pi*fo*t+angle(Dn(i)));
end


