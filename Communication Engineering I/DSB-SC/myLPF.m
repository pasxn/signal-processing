function y = myLPF(f_cut, Fs, x_input, win_length)

fNorm = f_cut / (Fs/2); 
[b,a] = butter(win_length, fNorm, 'low'); 
y = filter(b, a, x_input);
