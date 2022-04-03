clc;
clear;

R = 1;
L = 0.5;
K = 0.01;
J = 0.01;
b = 0.1;

s = tf('s');

kp = 75;
% ki = 1;
kd = 0;

P = K/((J*s+b)*(L*s+R)+K^2);

t = 0:0.0001:5;
hold on

for k = [10 50 80 100]
   C = pid(k, k*2.5, k*0.7);
   G = feedback(P*C, 1);
   step(G, t)
end