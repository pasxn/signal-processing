% setting up a suitable range of values for t
t = 0: pi/10000 :pi/4;

x1 = 3*exp( (6*pi*t + pi/2)*1i );
x2 = 3*exp( (12*pi*t + pi/2)*1i );

% plotting only the real parts of the functions
plot(t,real(x1),'b', t,real(x2),'r');
xlabel('t');
ylabel('x1(t) & x2(t)');
legend('x1(t)', 'x2(t)');