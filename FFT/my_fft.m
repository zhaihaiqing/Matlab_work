y=AD125;
Fs=12.5;%采样率
L=128;%数据序列长度
T=1/Fs;%采样间隔
t=(0:L-1)*T;%时间序列

%% 随机信号
% x=0.7*sin(2*pi*50*t)+sin(2*pi*120*t)+sin(2*pi*40*t)+sin(2*pi*10*t)+sin(2*pi*160*t);
% y=x+2*randn(size(t));
% y=x;

%%
subplot(2,1,1);
plot(Fs*t,y);
title('时域图')
hold on;
grid on;

NFFT=2^nextpow2(L);
Y=fft(y,NFFT)/L;
f=Fs/2*linspace(0,1,NFFT/2+1);
subplot(2,1,2);
plot(f,2*abs(Y(1:NFFT/2+1)));
title('频谱');
hold on;
grid on;



