J = 0.01;
b = 0.1;
K = 0.01;
R = 1;
L = 0.5;
s = tf('s');

P_motor = K/((J*s+b)*(L*s+R)+K^2);

Kp = 75;
Ki = 1;
Kd =1;

C = pid(Kp,Ki,Kd);

sys_cl = feedback(C*P_motor,1);

pidtool(sys_cl)