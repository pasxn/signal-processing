t = 0: pi/10000 :pi/4;
x = 3*cos(6*pi*t + pi/2);
y = 3*cos(12*pi*t +pi/2);

plot(t,x,'b', t,y,'r');
xlabel('t');
ylabel('x(t) & y(t)');
legend('x(t)', 'y(t)');