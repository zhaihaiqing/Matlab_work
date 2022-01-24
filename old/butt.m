 Wp=8*pi;
 Ws=12*pi;
 Rp=3;
 Rs=15;%设计低通滤波器：
 Fs=50;
[N,Wc]=buttord(Wp, Ws, Rp, Rs,'s');  
 %估算得到Butterworth低通滤波器的最小阶数N和3dB截止频率Wc
 %如果是数字滤波，没有‘s’,且参数为数字归一化（除以π）之后的参数
[Cs,Ca]=butter(N,Wc,'low','s');
%如果是数字滤波，没有‘s’
[h,f]=freqs(Cs,Ca); %模拟滤波器设计
[b,a]=bilinear(Cs,Ca,Fs);
[h,f]=freqz(b,a);
%如果是模拟，则freqs
 figure(1)
 scatter(f,abs(h))
 legend('滤波器')
 n=[1:1024];
 x=cos(2*pi/50*n)+2*sin(16*pi/50*n);
 y=filter(b,a,x);
 xf=fft(x,1024);
 yf=fft(y,1024);
 figure(2)
 plot(n,abs(xf),'r')
 legend('滤波前')
 figure(3)
 plot(n,abs(yf),'g')
 legend('滤波后')