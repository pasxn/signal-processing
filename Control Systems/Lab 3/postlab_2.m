clc;
clear;

num = [10];
den = [1 1];

t = 0:0.001:20;

r = sin(t+30);

y = lsim(num, den, r, t);

plot(t, y, 'b', t, r, 'r');

% rlocus(G)
% rltool(G)