y = yout;

sound(y, 44100);
% sound( y, -44100);        %% does not work with a -ve sampling frequency
sound(y, 2*44100);
sound(y, 0.5*44100);
%sound(y, 1-2*44100);       %% does not work with a -ve sampling frequency