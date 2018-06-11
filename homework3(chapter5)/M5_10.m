n = 0:1:255
x = zeros(1,256)
for m = 0:1:255
    x(1,m+1) = 0.1*m*exp(-0.03*m)
end
noise_fft = [zeros(1,50) 10*rand(1,156)-10 zeros(1,50)]       
noise = 5*(ifft(noise_fft,256))         %  利用随机数+ifft产生特定频率范围的随机信号
subplot(412)
plot(n,noise)
xlabel('n')
ylabel('noise')
title('高频噪音')
subplot(411)
plot(n,x)
xlabel('n')
ylabel('x[n]')
title('原信号')
subplot(413)
y = noise + x
plot(n,y)
xlabel('n')
ylabel('y[n]')
title('加入噪音的信号')
z = fft(y,256)
for m = 50:1:206
    z(1,m) = 0          %滤波
end
recover = ifft(z,256)
subplot(414)
plot(n,recover)
xlabel('n')
ylabel('recover')
title('复原后的信号')