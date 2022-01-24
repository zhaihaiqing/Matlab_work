[z,p,k]=buttap(4)
%n为滤波器的阶数，滤波器的零点z，极点p，增益k
 
[b,a ]=zp2tf(z,p,k)
%将模拟原型滤波器函数设计出的零点z，极点p，增益k，形式转换为传递函数形式
 
[H,w]=freqs(b,a,w)
%求传递函数的形式
 
%Matlab代码：
n=0:0.01:2;
for i=1:4
switch i
    case 1 ,N=2;  %频率点
    case 2 ,N=5;  %取4种滤波器
    case 3,N=10;
    case 4,N=20;
end
[z,p,k] =buttap ( N );        %设计butterworth滤波器
[b,a] = zp2tf(z,p,k);          %将零点、极点、增益的形式转换为传递函数
[H,w] =freqs(b,a,n);         %按n制定的频率点给出频率响应
magH2 = (abs(H)).^2;       %给出传递函数幅度平方
hold on;
plot (w, magH2);                
end
xlabel ('w/wc');
ylabel('|H(jw)|^2');
title('Butterworth');
text(1.5,0.18,'n=2');
text(1.3,0.08,'n=10');
text(1.16,0.08,'n=10');
text(0.93,0.98,'n=20');
grid on;