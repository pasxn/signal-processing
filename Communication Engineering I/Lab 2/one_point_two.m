clear all;
clc;

L = log2(16);

x_levels = [0 15 7 9 5 4 5 3 2];

N = length(x_levels);

for i = 1:N
    output =  dec2bin(x_levels(i), L);
    disp(output);
end
