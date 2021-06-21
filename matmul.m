x = randi([0,100],1000,1000);
y = randi([0,100],1000,1000);

z = dot(x, y);
disp(mean(z));