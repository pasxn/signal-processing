clc;
clear;

num = conv([1 2], [1 3]);
den = conv([1 2 2], conv([1 4], conv([1 5], [1 6])));

g = tf(num, den);

rltool(g)