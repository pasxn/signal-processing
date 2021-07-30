function [ y ] = g( n )

    ss = find(round(n) ~= n);
    n(ss) = NaN;
    
    y = 10*(0.8).^n.*sin(3*pi*n/16);
    
    y = y.*uD(n);
    
end

