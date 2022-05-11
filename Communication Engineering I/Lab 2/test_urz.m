clear all;
clc;

X = [1 0 1 1 0 0 1 0 1];

n = 1;
L = length(X);
X(L+1) = 1;

while n<=length(X)-1
    t = n-1:0.001:n;
    if X(n) == 0
        if X(n+1) == 0
            y = (t>n);
        else
            y = (t==n);
        end
        plot(t, y, 'LineWidth', 2.5, 'color', 'blue')
        title('Unipolar RZ line coding')
        grid on
        hold on
        axis([0 length(X)-1 -1.5 1.5]);
    else
        if X(n+1) == 0
            y = (t < n-0.5);
        else
            y = (t < n-0.5) + 1*(t == n);
        end
        plot(t, y, 'LineWidth', 2.5, 'color', 'blue')
        title('Unipolar RZ line coding')
        grid on
        hold on
        axis([0 length(X)-1 -0.25 1.5]);
    end
    n = n+1;
end