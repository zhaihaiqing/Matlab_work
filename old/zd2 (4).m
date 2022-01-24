%将震动采集采得的16进制数据转换为十进制，分为x、y、z三个坐标数据
%而后在同一个窗口中显示出来
close all;
clc;
aa1=textread('E:\HD\震动采集\震动采集数据\振动数据最新版\zd静止.TXT','%s');   %以符号的形式读入16进制文件    保存时是dlmwrite('filename.txt',a)
aaa1=hex2dec(aa1);                 %将16进制文件转换为10进制
zdsj1=aaa1(:)';                      %列反转为行
l1=length(zdsj1);                    %计算数组长度
k1=l1/3;                           %
x1=1:k1;                           %
y1=1:k1;                           %
z1=1:k1;                           %
yz1max1=((max(zdsj1)-2048)/2048)*50;
yz1min1=((min(zdsj1)-2048)/2048)*50;
for i1=1:l1-1                      %matlab数组下标是从1开始的
    j1=fix(i1/3)+1;                %取整后加1
    if mod(i1,3)==1               %求余操作
        x1(j1)=((zdsj1(i1)-2048)/2048)*50/1.15;
    else if mod(i1,3)==2
            y1(j1)=((zdsj1(i1)-2048)/2048)*50/1.15;
        else
            z1(j1)=((zdsj1(i1)-2048)/2048)*50/1.15;
        end
    end
end
n1=1:k1;

plot(n1,x1,'-r',n1,y1,'-b',n1,z1,'-g')
axis([0 k1 yz1min1 yz1max1])             %设置X Y坐标轴范围，格式是 axis([xmin xmax ymin ymax])
ylabel('震动值（g）')                 %Y坐标轴标注
xlabel('采样次数')
legend('X轴','Y轴','Z轴',3)      %图例标注
title('震动采集数据-静止数据')     %图标注
grid on
hold on


