clc; clear all; close all;

h = [3 2 1];
x = [1 1 1];

omega = [-3*pi:pi/100:3*pi];

H = 3 + 2*exp(-i*omega) + exp(-2i*omega);
X = 1 + exp(-i*omega) + exp(-2i*omega);

y = conv(x, h);

Y = X.*H;

YY = 3 + 5*exp(-i*omega) + 6*exp(-2i*omega) + 3*exp(-3i*omega) + exp(-4i*omega);

figure;
plot(omega, abs(Y), '+', 'Color', 'b'); 
title('Magnitude of Y and YY')

hold on;
plot(omega, abs(YY), 'o', 'Color', 'r'); 
hold off;

legend('|Y|','|YY|');
xlabel('omega');
ylabel('|Y| and |YY|');
grid on;

figure;
plot(omega, angle(Y), '+', 'Color', 'b'); 
title('Phase of Y and YY')

hold on;
plot(omega, angle(YY), 'o', 'Color', 'r'); 
hold off;

legend('angle(Y)','angle(YY)');
xlabel('omega');
ylabel('angle(Y) and angle(YY)');
grid on;