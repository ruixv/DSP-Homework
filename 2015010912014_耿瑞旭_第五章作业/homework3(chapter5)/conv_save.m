%%重叠保留法，具体见课本169页 
function conv1 = overlapsave(x,h)
% x = ones(1,200) %用于测试
% for m = 1:1:200
%     x(m) = 8*rand(1)-4
% end
% % x = [2,-3,4,5,-6,7,8,-9,-10,11,-12,-13,-14]
% h = [1,-2,-3] %用于测试
%x的长度应远远大于h的长度
h = h'
len_x = length(x);
len_h = length(h);
M = len_h
len_conv = len_x + len_h -1
% temp = ceil(log2(len_h));
% N = 2^(temp);       %171页下部的M和N
N = M+2
num = floor(len_x/M) +1    %对x切片的数量
x_m = zeros(num,N)      %对x切的片，每一行都是一个片
cir_m = zeros(num,len_conv)    %x的每个切片和y[n]相卷，存入一个矩阵
%N点圆周卷积，而M<=N,故需要视情况对h进行补0操作
if(N > len_h)
    for i = len_h+1:1:N
        h(1,i) = 0;
    end
end

%对x进行切片，每片长度为N
iN = 1;   %第iN个切片
iM = 1; %切片中的第
% for m = 1:N:num*N
x_m(1,:) = [zeros(1,N-M) x(1,1:M)]
x_m(num,:) = [x(1,len_x-N+M-mod(len_x,M)+1:len_x) zeros(1,M-mod(len_x,M)) ]
for iN = 2:1:num-1
    for iM = 1:1:N
        x_m(iN,iM) = x(1,(iN-1)*M+(iM-N+M))
    end
%     cir_m(iN,1+(iN-1)*(N-M+1):1+(iN-1)*(N-M+1)+(N-1)) = circonv(x_m(iN,:),h)
end
for iN=1:1:num
    for iM=1:1:N
        if 1+(iN-1)*(N-M+1)+(N-1) < len_conv
            cir_m(iN,1+(iN-1)*(N-M+1):1+(iN-1)*(N-M+1)+(N-1)) = circonv(x_m(iN,:),h)
    
        end
        end
end
        % circonv()
% aban = M-1      %开头不正确的需要被丢弃

%去掉cir_m每一行的前(M-1)个元素
cir_m_del = cir_m;
for m =1:1:num
    cir_m_del(m,1+(m-1)*(N-M+1):1+(m-1)*(N-M+1)+(M-1-1)) = 0
end

%将cir_m_del合并成为一个行向量，可得到线性卷积序列
% conv = zeros(1,len_conv)
% conv = zeros(1,len_x)
conv2 = sum(cir_m_del)
conv1 = conv(x,h)
for iJ = 1:1:len_conv-2
    conv2(iJ) = conv2(iJ+2);
end

