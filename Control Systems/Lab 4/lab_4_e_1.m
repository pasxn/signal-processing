s = tf('s');

system = (20 * (s^2 + s + 0.5) )/( s * (s + 1) * (s + 10) );

nyquist(system);
v = [-2 -3 2 2];
axis(v);
grid