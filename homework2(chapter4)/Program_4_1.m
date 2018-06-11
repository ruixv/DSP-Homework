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
M = 9
b = ones(M,1)/M;            %为什么/M
y = filter(b,1,x);              %对filter函数的理解
subplot(212)
plot(m,s,'r-',m,y,'b--')
legend('s[n]','y[n]');
xlabel ('Time index n');ylabel('Amplitude')