
% defining the independent variable 
t = 0:0.0001:5;

x1 = heaviside(t) + heaviside(t-1) - 2*heaviside(t-2);
x2 = heaviside(t) + (t-1).*heaviside(t-1) + (3-t).*heaviside(t-3) - 3*heaviside(t-4);


% PR.05

% x(1 ? 2t) 
figure();
plot(t, x1, 1-2*t, x1);
grid on
xlim([-10 6]);
ylim([-1 4]);
legend('x(t)', 'x(1-2t)');
grid on

figure();
plot(t, x2, 1-2*t, x2);
grid on
xlim([-10 6]);
ylim([-1 4]);
legend('x(t)', 'x(1-2t)');
grid on
