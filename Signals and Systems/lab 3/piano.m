function [magnitude, phase, power, frequency]=piano(file)

    [y, Fs] = audioread(file); 
    M=length(y); 
    N = pow2(nextpow2(M));                        
    g = fft(y,N); 
    g0=fftshift(g); 
    frequency = (-N/2:N/2-1)*Fs/N;
    cn = g0/N;  
    magnitude=abs(cn);
    phase = unwrap(angle(cn));
    power = cn.*conj(cn);
    
    % from the plot
    mag = [0.440 0.0 0.110 0.0 0.090 0.0 0.060 0.0 0.040];
    ang = [-130 -130 -140 -140 -150 -150 -170 -170 -180];
    Dn = mag.*exp(1i*ang);

    notes=[262, 262, 294, 262, 349, 330, 262, 262, 294, 262, 392, 349, 262, 262, 523, 440, 349, 330, 294, 466, 466, 440, 349, 392, 349];
    duration=[0.5, 0.5, 1, 1, 1, 2, 0.5, 0.5, 1, 1, 1, 2, 0.5, 0.5, 1, 1, 1, 1, 3, 0.5, 0.5, 1, 1, 1, 2];

    s = 44100;

    [x, s]=playMusicFS(notes, duration, Dn, s);
    p=audioplayer(x,s);
    play(p)
