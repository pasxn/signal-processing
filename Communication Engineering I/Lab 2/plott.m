t = 0:0.01:1;

x_t = 5*cos(100*pi*t) + 3*sin(400*pi*t);

plot(t, x_t, 'b-');
xlabel('t');
ylabel('x_t');
