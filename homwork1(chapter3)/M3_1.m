% Program 3_1
% Discrete-Time Fourier Transform Computation
%
% Read in the desired number of frequency samples
%2015010912014
k = input('Number of frequency points = ');
r = input('r=');
sita = input('sita=')
% Read in the numerator and denominator coefficients
c1 = -2*r*cos(sita)
c2 = r*r
num = 1
den = [1,c1,c2];
% Compute the frequency response
w = 0:pi/(k-1):pi;
h = freqz(num, den, w);
%interpreter grx
%  freqz Frequency response of digital filter
%       
%     [H,W] = freqz(B,A,N) returns the N-point complex frequency response
%     vector H and the N-point frequency vector W in radians/sample of
% %     the filter:
%                 jw               -jw              -jmw
%          jw  B(e)    b(1) + b(2)e + .... + b(m+1)e
%       H(e) = ---- = ------------------------------------
%                 jw               -jw              -jnw
%              A(e)    a(1) + a(2)e + .... + a(n+1)e
% % Plot the frequency response
%     H = freqz(...,W) returns the frequency response at frequencies
%     designated in vector W, in radians/sample (normally between 0 and pi).
%     W must be a vector with at least two elements.
%2015010912014
subplot(2,2,1)
plot(w/pi,real(h));grid
title('Real part')
xlabel('\omega/\pi'); ylabel('Amplitude')
subplot(2,2,2)
plot(w/pi,imag(h));grid
title('Imaginary part')
xlabel('\omega/\pi'); ylabel('Amplitude')
subplot(2,2,3)
plot(w/pi,abs(h));grid
title('Magnitude Spectrum')
xlabel('\omega/\pi'); ylabel('Magnitude')
subplot(2,2,4)
plot(w/pi,unwrap(angle(h)));grid        %»°œ‡Œª
title('Phase Spectrum')
xlabel('\omega/\pi'); ylabel('Phase, radians')