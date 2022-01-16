n = -5:48;

g0 = g(n);
g1 = g(2*n);
g2 = g(n/3);

subplot(3, 1, 1);
stem(n, g0, 'filled');
ylabel('g[n]');

subplot(3, 1, 2);
plot = stem(n, g1, 'filled');
ylabel('g[2n]');

subplot(3, 1, 3);
plot = stem(n, g2, 'filled');
ylabel('g[2/3]');