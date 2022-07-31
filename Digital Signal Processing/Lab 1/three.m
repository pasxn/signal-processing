clc; clear all; close all;

h = [1 -0.2 3 0.2];
x = [0.6 1.5 -0.2 0.5 0.6];
y = [];

Nx = length(x);
Nh = length(h);

x = [x zeros(1,Nh-1)];
h = [h zeros(1,Nx-1)];
count = 1;

for i = 1: Nx+Nh-1;
    y(i)=0;
    for j = 1:i;
        y(i)=y(i)+(x(j)*h(i-j+1)); 
    end
end

subplot(3,1,1);
stem(h, 'x', 'r');
title('Impulse Response');
xlim([-1 10]);
ylim([-1 7]);
ylabel('h[n]');
xlabel('n');

subplot(3,1,2);
stem(x, 'x', 'b');
title('Input');
xlim([-1 10]);
ylim([-1 7]);
ylabel('x[n]');
xlabel('n');

subplot(3,1,3);
stem(y, 'x', 'g');
title('output');
xlim([-1 10]);
ylim([-1 7]);
ylabel('y[n]');
xlabel('n');