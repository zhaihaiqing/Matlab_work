y=AD125;
Fs=12.5;%������
L=128;%�������г���
T=1/Fs;%�������
t=(0:L-1)*T;%ʱ������

%% ����ź�
% x=0.7*sin(2*pi*50*t)+sin(2*pi*120*t)+sin(2*pi*40*t)+sin(2*pi*10*t)+sin(2*pi*160*t);
% y=x+2*randn(size(t));
% y=x;

%%
subplot(2,1,1);
plot(Fs*t,y);
title('ʱ��ͼ')
hold on;
grid on;

NFFT=2^nextpow2(L);
Y=fft(y,NFFT)/L;
f=Fs/2*linspace(0,1,NFFT/2+1);
subplot(2,1,2);
plot(f,2*abs(Y(1:NFFT/2+1)));
title('Ƶ��');
hold on;
grid on;



