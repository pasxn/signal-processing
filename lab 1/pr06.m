
% defining the independent variable 
t = 0:0.0001:5;

x1 = heaviside(t) + heaviside(t-1) - 2*heaviside(t-2);
x2 = heaviside(t) + (t-1).*heaviside(t-1) + (3-t).*heaviside(t-3) - 3*heaviside(t-4);


% PR.05

% x(2t) 
figure();
plot(t, x1, 2*t, x1);
grid on
xlim([-1 6]);
ylim([-1 4]);
legend('x(t)', 'x(0.5t)');
grid on

figure();
plot(t, x2, 2*t, x2);
grid on
xlim([-1 12]);
ylim([-1 4]);
legend('x(t)', 'x(0.5t)');
grid on

% x(0.5t)
figure();
plot(t, x1, 0.5*t, x1);
grid on
xlim([-1 5]);
ylim([-1 3]);
legend('x(t)', 'x(2t)');
grid on

figure();
plot(t, x2, 0.5*t, x2);
grid on
xlim([-1 5]);
ylim([-1 4]);
legend('x(t)', 'x(2t)');
grid on


