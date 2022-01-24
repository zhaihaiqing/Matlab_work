%构造原函数
Fs = 52;            % Sampling frequency，采样率
T = 1/Fs;             % Sampling period，采样周期
N = 2963;             % Length of signal，数据长度
t = (0:N-1)*T;        % Time vector



%S = 1.9+0.7*sin(2*pi*50*t+3.14) + sin(2*pi*75*t)+0.5*sin(2*pi*100*t);%创建一个函数原型
%X = S + randn(size(t));%为S增加随机噪声
X = VarName2 ;%为S增加随机噪声
%%绘制出函数X
subplot(3,1,1);
plot(1000*t,X)
grid on; 
title('Original Signal')
xlabel('t (milseconds)')
ylabel('X(t)')

%%对X进行快速FFT
Y = fft(X);%Y为复数（a+ib），第一个点为直流分量数据，
           %2*模长/N为该频率点的幅度，atan2(b,a)为该频率点的相位，弧度
P2 = abs(Y);  %求变换后的模（幅值）
P1=P2(1:N/2+1);%保留左侧一半数据,奈奎斯特采样频率，右侧的一半为镜像数据
P1(1,1)=P1(1,1)/N;%计算直流成分幅值
P1(2:N/2+1)=P1(2:N/2+1)*2/N;%计算交流成分幅值

% P2 = abs(Y/N);  %求变换后的模（幅值）
% P1 = P2(1:N/2+1);%保留左侧一半数据,奈奎斯特采样频率，右侧的一半为镜像数据
% P1(2:end-1) = 2*P1(2:end-1);%计算幅值

% 
f = Fs*(0:(N/2))/N;%计算各个点对应的频率值
subplot(3,1,2);
plot(f,P1)
grid on; 
title('Single-Sided Amplitude Spectrum of X(t)')
xlabel('f (Hz)')
ylabel('|P1(f)|')


PY=Y;
tol = 0.4;  
PY(P1 < tol) = 0; %去除掉噪声干扰，只绘制出信号的相位
phase=angle(PY)*180/pi;
subplot(3,1,3);
plot(f,phase(1:N/2+1));
grid on; 
title('Single-Sided Phase Spectrum of X(t)')
xlabel('f (Hz)')
ylabel('Phase')


