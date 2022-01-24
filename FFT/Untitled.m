X=VarName2;

Fs=100;%������
T=1/Fs;%�������
L=length(X);%�������г���
t=(0:L-1)*T;%ʱ������

%% ����ź�
% x=0.7*sin(2*pi*50*t)+sin(2*pi*120*t)+sin(2*pi*40*t)+sin(2*pi*10*t)+sin(2*pi*160*t);
% y=x+2*randn(size(t));
% y=x;

%%
subplot(2,1,1);
plot(X);
title('ʱ��ͼ')
hold on;
grid on;

Y=fft(X);
P2 = abs(Y/L);
P1 = P2(1:L/2+1);
P1(2:end-1) = 2*P1(2:end-1);

f = Fs*(0:(L/2))/L;

subplot(2,1,2);
plot(f,P1); 
title('Ƶ��');
hold on;
grid on;





