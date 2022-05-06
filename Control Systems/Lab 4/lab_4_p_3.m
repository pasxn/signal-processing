s = tf('s');

system = ( (s + 1) * (s + 2) ) /( (s^2 + 2*s + 25 ) * (s^2) * (s + 3) );

controlSystemDesigner('bode', system)