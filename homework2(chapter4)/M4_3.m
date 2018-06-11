y = zeros(1,500)
alpha = input('alpha:')
c = 0.8;
y(1,1) = c + alpha - c*c;
y(1,2) = y(1,1) + alpha - y(1,1)*y(1,1);
i = 1
while ((abs(y(1,i+1)-y(1,i)) > 10E-80) & i<499)
    y(1,i+2) = y(1,i+1) + alpha - y(1,i+1)*y(1,i+1);
    i = i+1
end
z = ones(1,500).*sqrt(alpha);
vpa(y(1,i+1),70)
vpa(y(1,i+1),70)
plot(y)
hold
plot(z)
axis([1,i+5,0,alpha])
