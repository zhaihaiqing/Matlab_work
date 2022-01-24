 Wp=8*pi;
 Ws=12*pi;
 Rp=3;
 Rs=15;%��Ƶ�ͨ�˲�����
 Fs=50;
[N,Wc]=buttord(Wp, Ws, Rp, Rs,'s');  
 %����õ�Butterworth��ͨ�˲�������С����N��3dB��ֹƵ��Wc
 %����������˲���û�С�s��,�Ҳ���Ϊ���ֹ�һ�������ԦУ�֮��Ĳ���
[Cs,Ca]=butter(N,Wc,'low','s');
%����������˲���û�С�s��
[h,f]=freqs(Cs,Ca); %ģ���˲������
[b,a]=bilinear(Cs,Ca,Fs);
[h,f]=freqz(b,a);
%�����ģ�⣬��freqs
 figure(1)
 scatter(f,abs(h))
 legend('�˲���')
 n=[1:1024];
 x=cos(2*pi/50*n)+2*sin(16*pi/50*n);
 y=filter(b,a,x);
 xf=fft(x,1024);
 yf=fft(y,1024);
 figure(2)
 plot(n,abs(xf),'r')
 legend('�˲�ǰ')
 figure(3)
 plot(n,abs(yf),'g')
 legend('�˲���')