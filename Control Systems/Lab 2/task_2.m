clc;
clear;

R = 1;
L = 0.5;
K = 0.01;
J = 0.01;
b = 0.1;

s = tf('s');

kp = 10;
ki = 10;
kd = 0;

C = pid(kp, ki, kd);
P = K/((J*s+b)*(L*s+R)+K^2);
G = feedback(P*C, 1);

step(G)