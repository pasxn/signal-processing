clc; clear all; close all;

h = [3 2 1];

omega = [-3*pi:pi/100:3*pi];

H = 3 + 2*exp(-i*omega)+exp(-2i*omega);

figure; 
subplot(2,1,1) 
plot(omega, abs(H), 'g'); 
xlabel('omega'); 
ylabel('Magnitude');
title('Magnitude')

subplot(2,1,2) 
plot(omega, angle(H), 'r'); 
xlabel('omega'); 
ylabel('Phase');
title('Phase')