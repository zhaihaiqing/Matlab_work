clear;
or_data=textread('E:\HD\DIS100\DIS100功耗、温漂与精度分析\DIS100滤波器设计_测试用数据.txt');
k=2001;
k1=k+100;
data=or_data(k:k1,1);

N=length(data);
s=0;
buf=zeros(N,1);
ybar=0;

for x=1:N
    s=s+data(x);
    buf(x)=s;
    ybar=ybar+s/N;
end
a=(s-buf(1))/(N-1)


