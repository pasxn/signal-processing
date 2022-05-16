clear;
clc;

s = tf('s');
G = 1/(s*(s^2+4*s+5));

damp = 0.5;
rlocus(G);

sgrid([damp],[]);
[k,p] = rlocfind(G);

disp(k);
disp(p);

T = feedback(k*G,1);
step(T);