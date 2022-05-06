s = tf('s');

alpha = [0.2 0.3 0.4 0.5 0.6 0.7 0.8];

for i = alpha
    
    p = i/2;

    system = 1 /( ( (s/p) + 1 ) * (s^2 + s +1) );

    bode(system);

    margin(system);
    grid;
    
    hold on
end

% stepinfo(system)