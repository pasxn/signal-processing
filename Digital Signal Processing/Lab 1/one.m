x_n =  [-6 1 -2 5 3 0.5 1.5 -1.5 4 0 3];

n = [-3:1:7];

stem(n, x_n, 'x', 'r');

xlim([-5 10]);
ylim([-8 8]);

title('Discrete Signal');
xlabel('n');
ylabel('x[n]');