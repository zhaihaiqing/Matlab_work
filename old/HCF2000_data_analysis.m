close all;
clc;


data8001_18=importdata('C:\Users\haiqing\Desktop\HCF2000_测试数据\8003_46-24 -d.txt','%s');
temp8001_18=importdata('C:\Users\haiqing\Desktop\HCF2000_测试数据\8003_46-24 -t.txt','%s');
l1=length(data8001_18);
l2=1;
data8001=data8001_18(l2:l1);
temp8001=temp8001_18(l2:l1);

maxdata=max(data8001)
mindata=min(data8001)
l=length(data8001);
len=1:l;


subplot(2,1,1)
plot(len,data8001,'-r')
axis([0 l mindata-0.01 maxdata+0.01])
ylabel('角度值')
xlabel('采样次数')
title('升温角度曲线')
grid on
hold on

subplot(2,1,2)
plot(len,temp8001,'-b')
maxtemp=max(temp8001)
mintemp=min(temp8001)
axis([0 l mintemp-1 maxtemp+1])
ylabel('温度值')
xlabel('采样次数')
title('升温曲线')
grid on
hold on




