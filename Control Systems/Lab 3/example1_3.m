clc;
clear;

s = tf('s');

G = 1/( s * (s + 3) * (s^2 + 6*s + 64) );

% rlocus(G);

k = 232;
Gn = k*G;

T = feedback(Gn, 1);
step(T)