function [t,cn] = square_spectrum(k,l,m,tau,f0)
%function [t,cn] = square_spectrum(k,l,m,tau,f0)
% k,l,m are the dimensions of subplot(k,l,m)
% tau - is the pulse width 
% f0 - fundamental frequency
% Example usage
%   square_spectrum(3,1,1,0.25,1);
%   square_spectrum(3,1,2,0.125,1);
%   square_spectrum(3,1,3,0.25,0.5);
% ECK/09/09/2018 v1.0
A=1;
c0=A*tau*f0;
n=1:100;
cn=[(A./((-n)*pi)).*sin(-n*pi*f0*tau) c0 (A./(n*pi)).*sin(n.*pi*f0*tau)];
subplot(k,l,m)
t=[-n*f0 0 n*f0];
stem(t,abs(cn))
axis([-40 40 0 f0*tau]);
grid
xlabel('nf0')
ylabel('|c_n|')
title([' f0= ' num2str(f0) ' and  tau= ' num2str(tau) ])
end

