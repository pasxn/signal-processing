function [cn,n]=squareFS(A,tau,fo,Samples)
% function [cn,n]=squareFS(A,tau,fo,Samples)
% This function will sketch and produce the Fourier Series coefficients 
% for a periodic square pulse of frequency fo, pulse duration tau, and
% amplitude A.
% Samples: this is the number of fourier coeffieicnts you want
% n: is the coefficient space [-Sample:Sample]
% cn: the Fourier Coefficients
% Example [cn,n]=squareFS(1,0.5,1,10)
% Note that the plots are limited in the x-axis to nfo=4
% ECK/28/08/2016

np=[1:Samples];
nm=[-Samples:-1];
c0=(A*tau*fo);
cnp=(c0*sin(pi*np*fo*tau)./(pi*np*fo*tau)).*exp(-i*pi*np*fo*tau);
cnm=(c0*sin(pi*nm*fo*tau)./(pi*nm*fo*tau)).*exp(-i*pi*nm*fo*tau);
cn=[cnm c0 cnp];
n=[nm 0 np];
FS_mag=abs(cn);
FS_phase=angle(cn)*180/pi;
subplot(2,1,1);
stem(n*fo,FS_mag)
xlim([-4 4])
ylabel('|C_n|');
xlabel('nf_o');
t=sprintf('Fourier coefficients of a square pulse train with A=%d, f_0=%.02f Hz, and tau=%.02f sec', A, fo, tau);
title(t)
subplot(2,1,2);
stem(n*fo,FS_phase)
xlim([-4 4])
ylabel('\angle{c_n}');
xlabel('nf_o');
