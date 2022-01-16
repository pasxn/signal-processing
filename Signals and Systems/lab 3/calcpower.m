function [magnitude, phase, power, frequency]=calcpower(file)

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
    disp(sum(power));