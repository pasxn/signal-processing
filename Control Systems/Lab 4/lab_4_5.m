s = tf('s');

for beta = 1:0.5:10
    system = ( s + beta )/( s * (s + 1) * (s^2 + 8*s + 52) );
    rlocus(system);
    
    hold on
end