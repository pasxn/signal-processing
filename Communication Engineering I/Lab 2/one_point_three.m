clear all;
clc;

lower_bound = -0.6;
upper_bound = 0.6;

random_variable = lower_bound + (upper_bound-lower_bound).*rand();

disp(random_variable);