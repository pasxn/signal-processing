close all
clear all
clc

%The original signal varies between -4 and 4, 
%i.e., (-4, 4). 

%xs: the given sampled values
xs = [-3.9 2.2 0.1 -0.1  -1.5 3.4 -2.1 1.3]; 
N = length(xs);
ts = 1:N;

%The quantizer
%=================
xq = zeros(1, N);
for loop = 1:N
    if xs(loop) == 0
       xq(loop) = 0.5;
    else 
       xq(loop) = sign(xs(loop)).*(-0.5+ceil(abs(xs(loop)))); %Quantized signal
    end
end
%================

figure(1)
plot(ts, xs, 'ro')
hold on
plot(ts, xq, 'b+')
axis([1 N -4 4])
grid on

