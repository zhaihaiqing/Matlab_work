%将震动采集采得的16进制数据转换为十进制，分为x、y、z三个坐标数据
%而后在同一个窗口中显示出来
close all;
clc;

lujing=which('zd1.m');
aa1=textread('E:\HD\震动采集\震动采集数据\振动数据最新版\zd静止.TXT','%s');   %以符号的形式读入16进制文件    保存时是dlmwrite('filename.txt',a)
aa2=textread('E:\HD\震动采集\震动采集数据\振动数据最新版\zd静止平均.TXT','%s');
aa3=textread('E:\HD\震动采集\震动采集数据\振动数据最新版\zd震动平均.TXT','%s');
aa4=textread('E:\HD\震动采集\震动采集数据\振动数据最新版\zd静止平均重物.TXT','%s');
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
        x1(j1)=((zdsj1(i1)-2048)/2048)*50;
    else if mod(i1,3)==2
            y1(j1)=((zdsj1(i1)-2048)/2048)*50;
        else
            z1(j1)=((zdsj1(i1)-2048)/2048)*50;
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


aaa2=hex2dec(aa2);                 %将16进制文件转换为10进制
zdsj2=aaa2(:)';                      %列反转为行
l2=length(zdsj2);                    %计算数组长度
k2=l2/3;                           %
x2=1:k2;                           %
y2=1:k2;                           %
z2=1:k2;                           %
yz1max2=((max(zdsj2)-2048)/2048)*50;
yz1min2=((min(zdsj2)-2048)/2048)*50;
for i2=1:l2-1                      %matlab数组下标是从1开始的
    j2=fix(i2/3)+1;                %取整后加1
    if mod(i2,3)==1               %求余操作
        x2(j2)=((zdsj2(i2)-2048)/2048)*50;
    else if mod(i2,3)==2
            y2(j2)=((zdsj2(i2)-2048)/2048)*50;
        else
            z2(j2)=((zdsj2(i2)-2048)/2048)*50;
        end
    end
end
n2=1:k2;

figure;
plot(n2,x2,'-r',n2,y2,'-b',n2,z2,'-g')
axis([0 k2 yz1min2 yz1max2])             %设置X Y坐标轴范围，格式是 axis([xmin xmax ymin ymax])
ylabel('震动值（g）')                 %Y坐标轴标注
xlabel('采样次数')
legend('X轴','Y轴','Z轴',3)      %图例标注
title('震动采集数据-静止平均')     %图标注
grid on
hold on


aaa3=hex2dec(aa3);                 %将16进制文件转换为10进制
zdsj3=aaa3(:)';                      %列反转为行
l3=length(zdsj3);                    %计算数组长度
k3=l3/3;                           %
x3=1:k3;                           %
y3=1:k3;                           %
z3=1:k3;                           %
yz1max3=((max(zdsj3)-2048)/2048)*50;
yz1min3=((min(zdsj3)-2048)/2048)*50;
for i3=1:l3-1                      %matlab数组下标是从1开始的
    j3=fix(i3/3)+1;                %取整后加1
    if mod(i3,3)==1               %求余操作
        x3(j3)=((zdsj3(i3)-2048)/2048)*50;
    else if mod(i3,3)==2
            y3(j3)=((zdsj3(i3)-2048)/2048)*50;
        else
            z3(j3)=((zdsj3(i3)-2048)/2048)*50;
        end
    end
end
n3=1:k3;

figure;
plot(n3,x3,'-r',n3,y3,'-b',n3,z3,'-g')
axis([0 k3 yz1min3 yz1max3])             %设置X Y坐标轴范围，格式是 axis([xmin xmax ymin ymax])
ylabel('震动值（g）')                 %Y坐标轴标注
xlabel('采样次数')
legend('X轴','Y轴','Z轴',3)      %图例标注
title('震动采集数据-震动平均')     %图标注
grid on
hold on


aaa4=hex2dec(aa4);                 %将16进制文件转换为10进制
zdsj4=aaa4(:)';                      %列反转为行
l4=length(zdsj4);                    %计算数组长度
k4=l4/3;                           %
x4=1:k4;                           %
y4=1:k4;                           %
z4=1:k4;                           %
yz1max4=((max(zdsj4)-2048)/2048)*50;
yz1min4=((min(zdsj4)-2048)/2048)*50;
for i4=1:l4-1                      %matlab数组下标是从1开始的
    j4=fix(i4/3)+1;                %取整后加1
    if mod(i4,3)==1               %求余操作
        x4(j4)=((zdsj4(i4)-2048)/2048)*50;
    else if mod(i4,3)==2
            y4(j4)=((zdsj4(i4)-2048)/2048)*50;
        else
            z4(j4)=((zdsj4(i4)-2048)/2048)*50;
        end
    end
end
n4=1:k4;

figure;
plot(n4,x4,'-r',n4,y4,'-b',n4,z4,'-g')
axis([0 k4 yz1min4 yz1max4])             %设置X Y坐标轴范围，格式是 axis([xmin xmax ymin ymax])
ylabel('震动值（g）')                 %Y坐标轴标注
xlabel('采样次数')
legend('X轴','Y轴','Z轴',3)      %图例标注
title('震动采集数据-静止状态、平均重物')     %图标注
grid on
hold on



%以下为子图模式下相同坐标轴对比
yz2max=20;
yz2min=-20;
figure;
subplot(2,2,1);
plot(n1,x1,'-r',n1,y1,'-b',n1,z1,'-g')
%axis([0 k1 yz1min1 yz1max1])             %设置X Y坐标轴范围，格式是 axis([xmin xmax ymin ymax])
axis([0 k1 yz2min yz2max])             %设置X Y坐标轴范围，格式是 axis([xmin xmax ymin ymax])
ylabel('震动值（g）')                 %Y坐标轴标注
xlabel('采样次数')
legend('X轴','Y轴','Z轴',3)      %图例标注
title('震动采集数据-静止数据')     %图标注
grid on
hold on

subplot(2,2,2);
plot(n2,x2,'-r',n2,y2,'-b',n2,z2,'-g')
%axis([0 k2 yz1min2 yz1max2])             %设置X Y坐标轴范围，格式是 axis([xmin xmax ymin ymax])
axis([0 k2 yz2min yz2max])             %设置X Y坐标轴范围，格式是 axis([xmin xmax ymin ymax])
ylabel('震动值（g）')                 %Y坐标轴标注
xlabel('采样次数')
legend('X轴','Y轴','Z轴',3)      %图例标注
title('震动采集数据-静止平均')     %图标注
grid on
hold on

subplot(2,2,3);
plot(n3,x3,'-r',n3,y3,'-b',n3,z3,'-g')
%axis([0 k3 yz1min3 yz1max3])             %设置X Y坐标轴范围，格式是 axis([xmin xmax ymin ymax])
axis([0 k3 yz2min yz2max])             %设置X Y坐标轴范围，格式是 axis([xmin xmax ymin ymax])
ylabel('震动值（g）')                 %Y坐标轴标注
xlabel('采样次数')
legend('X轴','Y轴','Z轴',3)      %图例标注
title('震动采集数据-震动平均')     %图标注
grid on
hold on

subplot(2,2,4);
plot(n4,x4,'-r',n4,y4,'-b',n4,z4,'-g')
%axis([0 k4 yz1min4 yz1max4])             %设置X Y坐标轴范围，格式是 axis([xmin xmax ymin ymax])
axis([0 k4 yz2min yz2max])             %设置X Y坐标轴范围，格式是 axis([xmin xmax ymin ymax])
ylabel('震动值（g）')                 %Y坐标轴标注
xlabel('采样次数')
legend('X轴','Y轴','Z轴',3)      %图例标注
title('震动采集数据-静止状态、平均重物')     %图标注
grid on
hold on
