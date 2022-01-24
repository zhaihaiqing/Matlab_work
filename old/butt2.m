%低通滤波器参数：Fs=8000，fp=2500，fs=3500，Rp=1dB，As=30dB，其他滤波器可以通过与低通之间的映射关系实现。
%%模拟滤波器
%巴特沃斯——滤波器设计
wp=2*pi*2500;ws=2*pi*3500;Rp=1;As=30;
[N,wc]=buttord(wp,ws,Rp,As,'s')%计算率波器的阶数和3dB截止频率
[B,A]=butter(N,wc,'s');%计算滤波器系统函数分子分母多项式
fk=0:800/512:8000;wk=2*pi*fk;
Hk=freqs(B,A,wk);
figure
plot(fk/1000,20*log10(abs(Hk)));
grid on,xlabel('频率（kHz）'),ylabel('幅度（dB）')
title('巴特沃斯模拟滤波器')
axis([0,4,-35,5])

