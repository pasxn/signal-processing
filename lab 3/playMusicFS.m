function [x,Fs]=playMusicFS(notes, duration, Dn, Fs)
% function [x,Fs]=playMusicFS(notes, duration, Dn, Fs)
% This function will produce the sequence which can be played as an audio
% track.
% notes: this is a vector of all the notes which have to be played
% duration: these are the corresponding durations of paying the individual
% notes
% cn: this is a vector with the fourier series corfficients in complex form
% Fs: sampling frequency 
% ECK/29/08/2016

note = @(n,d) musicNote(n,d,Dn,Fs);
x = []; 
for i=1:length(notes)
x = [x note(notes(i), duration(i))];
end
