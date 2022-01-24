
%%
%����һ������ź�
S = 0.7*sin(2*pi*50*t) + sin(2*pi*120*t);%ԭʼ�ź�
X = S + 2*randn(size(t));               %��Ӱ������ź�
plot(1000*t(1:1500),X(1:1500))
title('Signal Corrupted with Zero-Mean Random Noise')
xlabel('t (milliseconds)')
ylabel('X(t)')

%%

Fs = 1000;            % Sampling frequency                    
T = 1/Fs;             % Sampling period       
L = 1500;             % Length of signal
t = (0:L-1)*T;        % Time vector


 Y = fft(X);        %��X��fft�����س���Ϊn�ĸ�������
 P2 = abs(Y/L);     %���Գ��Ⱥ���ģ���õ�Ƶ��P2
 plot(P2);
%  P1 = P2(1:L/2+1);
%  P1(2:end-1) = 2*P1(2:end-1);
% % 
% % 
%  f = Fs*(0:(L/2))/L;
%  plot(f,P1) 
% title('Single-Sided Amplitude Spectrum of X(t)')
% xlabel('f (Hz)')
% ylabel('|P1(f)|')

