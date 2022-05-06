s = tf('s');
alpha = 0.1; 
p = alpha/2;

system = 1 /( ( (s/p) + 1 ) * (s^2 + s +1) );

bode(system);

margin(system);
grid