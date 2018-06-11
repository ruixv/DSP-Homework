coe = [-4.8788 9.5631 -4.8788]
[H,w] = freqz(coe,1,512);
plot(w/pi, abs(H));
xlabel('\omega/\pi')
ylabel('Magnitude')
title('4.69µÄÂË²¨Æ÷')