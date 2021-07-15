x = 0:pi/100:10*pi;
y = cos(x);
z = sin(x);

subplot(2, 1, 1);
plot(x, y);
% plot(x, y, 'r', x, z, 'b');


% xlabel('Time(s)');
% ylabel('Voltage(v)');
% title('cosine wave');
% grid on;
% legend('cos(x)');

% axis([0 10*pi -1 1]);
% xlim([0 8*pi]);
% ylim([0 1]);
% figure;
% plot(x,y,'r--');
subplot(2, 1, 2);
plot(x, z);