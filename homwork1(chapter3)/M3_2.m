tic;
% grx
k = 500;
% Read in the numerator and denominator coefficients
num1 = zeros(1,15);
den1 = zeros(1,15);
num1(1) = 1;
num1(11) = 1;
den1(11) = 1;
den1(12) = -1;
% Compute the frequency response
w = 0:pi/(k-1):pi;
num1
den1
h1 = freqz(num1, den1, w);
subplot(5,4,1)
plot(w/pi,real(h1));grid
title('Real part(a)')
xlabel('\omega/\pi'); ylabel('Amplitude')
subplot(5,4,2)
plot(w/pi,imag(h1));grid
title('Imaginary part')
xlabel('\omega/\pi'); ylabel('Amplitude')
subplot(5,4,3)
plot(w/pi,abs(h1));grid
title('Magnitude Spectrum')
xlabel('\omega/\pi'); ylabel('Magnitude')
subplot(5,4,4)
plot(w/pi,unwrap(angle(h1)));grid        %取相位
title('Phase Spectrum')
xlabel('\omega/\pi'); ylabel('Phase, radians')
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%5
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%g%%r%%x%%%%%%%%%%%%5
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%第二问开始%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
num2 = zeros(1,15);
den2 = zeros(1,15);
num2(1) = 1;
num2(11) = -1;
den2(1) = 1;
den2(2) = -1;
w = 0:pi/(k-1):pi;
num2
den2
h2 = freqz(num2, den2, w);
subplot(5,4,5)
plot(w/pi,real(h2));grid
title('Real part(b)')
xlabel('\omega/\pi'); ylabel('Amplitude')
subplot(5,4,6)
plot(w/pi,imag(h2));grid
title('Imaginary part')
xlabel('\omega/\pi'); ylabel('Amplitude')
subplot(5,4,7)
plot(w/pi,abs(h2));grid
title('Magnitude Spectrum')
xlabel('\omega/\pi'); ylabel('Magnitude')
subplot(5,4,8)
plot(w/pi,unwrap(angle(h2)));grid        %取相位
title('Phase Spectrum')
xlabel('\omega/\pi'); ylabel('Phase, radians')

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%g%%r%%x%%%%%%%%%%5
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%第三问开始%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
num3 = zeros(1,15);
den3 = zeros(1,15);
num3(1) = 1;
num3(11) = 1;
num3(6) = -2;
den3(11) = 1;
den3(12) = -2;
den3(13) = 1
w = 0:pi/(k-1):pi;
num3
den3
h3 = freqz(num3, den3, w);
subplot(5,4,9)
plot(w/pi,real(h3));grid
title('Real part(c)')
xlabel('\omega/\pi'); ylabel('Amplitude')
subplot(5,4,10)
plot(w/pi,imag(h3));grid
title('Imaginary part')
xlabel('\omega/\pi'); ylabel('Amplitude')
subplot(5,4,11)
plot(w/pi,abs(h3));grid
title('Magnitude Spectrum')
xlabel('\omega/\pi'); ylabel('Magnitude')
subplot(5,4,12)
plot(w/pi,unwrap(angle(h3)));grid        %取相位
title('Phase Spectrum')
xlabel('\omega/\pi'); ylabel('Phase, radians')

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%5
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%第四问开始%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% num4 = zeros(1,21);
den4 = zeros(1,15);
num4= [1,2,3,4,5,6,7,8,9,10,11,10,9,8,7,6,5,4,3,2,1];
den4(11) = 1;
w = 0:pi/(k-1):pi;
num4
den4
h4 = freqz(num4, den4, w);
subplot(5,4,13)
plot(w/pi,real(h4));grid
title('Real part(d)')
xlabel('\omega/\pi'); ylabel('Amplitude')
subplot(5,4,14)
plot(w/pi,imag(h4));grid
title('Imaginary part')
xlabel('\omega/\pi'); ylabel('Amplitude')
subplot(5,4,15)
plot(w/pi,abs(h4));grid
title('Magnitude Spectrum')
xlabel('\omega/\pi'); ylabel('Magnitude')
subplot(5,4,16)
plot(w/pi,unwrap(angle(h4)));grid        %取相位
title('Phase Spectrum')
xlabel('\omega/\pi'); ylabel('Phase, radians')

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%5
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%第五问开始%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% num5 = zeros(1,21);
den5 = zeros(1,15);
num5= [cos(0.5*pi),cos(0.45*pi),cos(0.4*pi),cos(0.35*pi),cos(0.3*pi),cos(0.25*pi),cos(0.2*pi),cos(0.15*pi),cos(0.1*pi),cos(0.05*pi),1,cos(0.05*pi),cos(0.1*pi),cos(0.15*pi),cos(0.2*pi),cos(0.25*pi),cos(0.3*pi),cos(0.35*pi),cos(0.4*pi),cos(0.45*pi),cos(0.5*pi)];
den5(11) = 1;
w = 0:pi/(k-1):pi;
num5
den5
h5 = freqz(num5, den5, w);
subplot(5,4,17)
plot(w/pi,real(h5));grid
title('Real part(e)')
xlabel('\omega/\pi'); ylabel('Amplitude')
subplot(5,4,18)
plot(w/pi,imag(h5));grid
title('Imaginary part')
xlabel('\omega/\pi'); ylabel('Amplitude')
subplot(5,4,19)
plot(w/pi,abs(h5));grid
title('Magnitude Spectrum')
xlabel('\omega/\pi'); ylabel('Magnitude')
subplot(5,4,20)
plot(w/pi,unwrap(angle(h5)));grid        %取相位
title('Phase Spectrum')
xlabel('\omega/\pi'); ylabel('Phase, radians')
toc;
