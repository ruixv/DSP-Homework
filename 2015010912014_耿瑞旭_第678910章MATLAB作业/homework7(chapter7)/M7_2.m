b = input('num = ');
a = input('den = ');
[H,w] = freqz(b,a,100);
magH = abs(H);
subplot(121)
plot(w/pi,magH);
xlabel('频率(w/pi)')
ylabel('幅度')
subplot(122)
plot(w/pi,angle(H));
xlabel('频率(w/pi)')
ylabel('相位')