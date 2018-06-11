
g = [3,2,-2,1,0,1];
g1 = [3-2i, 4-i, -2+3j, j, 0]
g2 = [cos(pi*0/2),cos(pi*1/2),cos(pi*2/2),cos(pi*3/2),cos(pi*4/2)]
% n = length(g)
n1 = length(g1)
n2 = length(g2) 
h = [-5,-1,3,-2,4,4];
h1 = [1-3j, -2-j, 2+2j, 3, -2+4j]
h2 = [1,3,9,27,81]
Y = fft(g).*fft(h)
Y1 = fft(g1).*fft(h1)
Y2 = fft(g2).*fft(h2)
y = ifft(Y)
y1 = ifft(Y1)
y2 = ifft(Y2)
yy = circonv(g,h)
yy1 = circonv(g1,h1)
yy2 = circonv(g2,h2)
% t = 0:1:n-1
subplot(321)
stem(y)
xlabel('n')
ylabel('y[n]')
title('基于DFT的方法')
subplot(322)
stem(t,yy)
xlabel('n')
ylabel('y[n]')
title('利用circonv')
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
subplot(323)
stem(y1)
xlabel('n')
ylabel('y1[n]')
title('基于DFT的方法')
subplot(324)
stem(yy1)
xlabel('n')
ylabel('y1[n]')
title('利用circonv')
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
subplot(325)
stem(y2)
xlabel('n')
ylabel('y2[n]')
title('基于DFT的方法')
subplot(326)
stem(yy2)
xlabel('n')
ylabel('y2[n]')
title('利用circonv')
