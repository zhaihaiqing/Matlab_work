%����ԭ����
Fs = 52;            % Sampling frequency��������
T = 1/Fs;             % Sampling period����������
N = 2963;             % Length of signal�����ݳ���
t = (0:N-1)*T;        % Time vector



%S = 1.9+0.7*sin(2*pi*50*t+3.14) + sin(2*pi*75*t)+0.5*sin(2*pi*100*t);%����һ������ԭ��
%X = S + randn(size(t));%ΪS�����������
X = VarName2 ;%ΪS�����������
%%���Ƴ�����X
subplot(3,1,1);
plot(1000*t,X)
grid on; 
title('Original Signal')
xlabel('t (milseconds)')
ylabel('X(t)')

%%��X���п���FFT
Y = fft(X);%YΪ������a+ib������һ����Ϊֱ���������ݣ�
           %2*ģ��/NΪ��Ƶ�ʵ�ķ��ȣ�atan2(b,a)Ϊ��Ƶ�ʵ����λ������
P2 = abs(Y);  %��任���ģ����ֵ��
P1=P2(1:N/2+1);%�������һ������,�ο�˹�ز���Ƶ�ʣ��Ҳ��һ��Ϊ��������
P1(1,1)=P1(1,1)/N;%����ֱ���ɷַ�ֵ
P1(2:N/2+1)=P1(2:N/2+1)*2/N;%���㽻���ɷַ�ֵ

% P2 = abs(Y/N);  %��任���ģ����ֵ��
% P1 = P2(1:N/2+1);%�������һ������,�ο�˹�ز���Ƶ�ʣ��Ҳ��һ��Ϊ��������
% P1(2:end-1) = 2*P1(2:end-1);%�����ֵ

% 
f = Fs*(0:(N/2))/N;%����������Ӧ��Ƶ��ֵ
subplot(3,1,2);
plot(f,P1)
grid on; 
title('Single-Sided Amplitude Spectrum of X(t)')
xlabel('f (Hz)')
ylabel('|P1(f)|')


PY=Y;
tol = 0.4;  
PY(P1 < tol) = 0; %ȥ�����������ţ�ֻ���Ƴ��źŵ���λ
phase=angle(PY)*180/pi;
subplot(3,1,3);
plot(f,phase(1:N/2+1));
grid on; 
title('Single-Sided Phase Spectrum of X(t)')
xlabel('f (Hz)')
ylabel('Phase')


