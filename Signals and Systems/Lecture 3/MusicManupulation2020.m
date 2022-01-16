% original sound cut
[y, Fs]=audioread('cut01.mp3');
% x(2t)
y1=downsample(y,2);
audiowrite('cut02.wav',y1,Fs);
% x(0.5t)
y2=upsample(y,2);
audiowrite('cut03.wav',y2,Fs);
% x(-t)
y3=y(:);
y3=y3';
y3=fliplr(y3);
audiowrite('cut04.wav',y3,Fs);
% resample at one tenth the rate
y4=resample(y,1,10);
audiowrite('cut05.wav',y4,Fs/10);