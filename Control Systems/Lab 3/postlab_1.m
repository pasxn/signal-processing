clc;
clear;

s = tf('s');

K = 1;
a = 1.01;
T = 1;
Kr = 1.19;

G = ( K*(Kr*s + 1) ) / ( (s + a)*(s*(T * s + 1) + K) );

stepinfo(G)