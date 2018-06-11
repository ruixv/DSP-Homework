% Program 4_1
% Signal Smoothing by a Moving-Average Filter
%通过移动平均滤波器进行信号平滑处理
clear all 
R = 50;
d = rand(R,1)-0.5;      %噪音
m = 0:1:R-1;
s = 2*m.*(0.9.^m);      %规整信号
x  = s + d';            %加噪音信号
subplot(211)
plot(m,d,'r-',m,s,'b-',m,x,'g-')
xlabel('Time index n'); ylabel('Amplitude')
legend('d[n]','s[n]','x[n]');
% pause
M = input('Number of input samples = ');
b = ones(M,1)/M;            %为什么/M
y = conv_save(x,b);              %对filter函数的理解
y(length(y)-1,:) = []
y(length(y),:) = []
subplot(212)
plot(s,'r-')
hold on
plot(y)
legend('s[n]','y[n]');
xlabel ('Time index n');ylabel('Amplitude')