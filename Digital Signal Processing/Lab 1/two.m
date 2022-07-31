n = linspace(0, 8*pi, 50);

x_1 = sin(pi*n/10);
x_2 = cos(pi*n/10);
x_3 = sin(pi*n/10)+cos(pi*n/10);
x_4 = sin(pi*n/10).*cos(pi*n/10);

subplot(2,2,1);
stem(n, x_1, 'x', 'r');
title('sin(pi*n/10)');
ylabel('x_1');
xlabel('n');

subplot(2,2,2);
stem(n, x_2, 'x', 'b');
title('cos(pi*n/10)');
ylabel('x_2');
xlabel('n');

subplot(2,2,3);
stem(n, x_3, 'x', 'y');
title('sin(pi*n/10)+cos(pi*n/10)');
ylabel('x_3');
xlabel('n');

subplot(2,2,4);
stem(n, x_4, 'x', 'g');
title('sin(pi*n/10).*cos(pi*n/10)');
ylabel('x_4');
xlabel('n');