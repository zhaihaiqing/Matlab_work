%构造原函数
Fs = 62.5;            % Sampling frequency
T = 1/Fs;             % Sampling period
L = 4096;             % Length of signal
t = (0:L-1)*T;        % Time vector

%S = 1.9+0.7*sin(2*pi*50*t+30) + sin(2*pi*75*t)+0.5*sin(2*pi*100*t);%创建一个函数原型
X = V1;%为S增加随机噪声
%%绘制出函数X
subplot(2,1,1);
plot(t,X)
title('Signal Corrupted with Zero-Mean Random Noise')
xlabel('t (seconds)')
ylabel('X(t)')

%%对X进行快速FFT
Y = fft(X);
P2 = abs(Y/L);  %求变换后的模（幅值）
P1 = P2(1:L/2+1);%保留左侧一半数据
P1(2:end-1) = 2*P1(2:end-1);%计算幅值
% 
f = Fs*(0:(L/2))/L;
subplot(2,1,2);
plot(f,P1)
title('Single-Sided Amplitude Spectrum of X(t)')
xlabel('f (Hz)')
ylabel('|P1(f)|')

% phase=angle(Y)/pi*180;
% subplot(3,1,3);
% plot(f,phase(1:L/2+1));
% title('Single-Sided Phase Spectrum of X(t)')
% xlabel('f (Hz)')
% ylabel('Phase')


