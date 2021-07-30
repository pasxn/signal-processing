function y = impD( n )
    y = double(n == 0);
    
    ss = find(round(n) ~= n);
    
    y(ss) = NaN;
end

