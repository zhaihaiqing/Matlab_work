%���𶯲ɼ��ɵõ�16��������ת��Ϊʮ���ƣ���Ϊx��y��z������������
%������ͬһ����������ʾ����
close all;
clc;

lujing=which('zd1.m');
aa1=textread('E:\HD\�𶯲ɼ�\�𶯲ɼ�����\���������°�\zd��ֹ.TXT','%s');   %�Է��ŵ���ʽ����16�����ļ�    ����ʱ��dlmwrite('filename.txt',a)
aa2=textread('E:\HD\�𶯲ɼ�\�𶯲ɼ�����\���������°�\zd��ֹƽ��.TXT','%s');
aa3=textread('E:\HD\�𶯲ɼ�\�𶯲ɼ�����\���������°�\zd��ƽ��.TXT','%s');
aa4=textread('E:\HD\�𶯲ɼ�\�𶯲ɼ�����\���������°�\zd��ֹƽ������.TXT','%s');
aaa1=hex2dec(aa1);                 %��16�����ļ�ת��Ϊ10����
zdsj1=aaa1(:)';                      %�з�תΪ��
l1=length(zdsj1);                    %�������鳤��
k1=l1/3;                           %
x1=1:k1;                           %
y1=1:k1;                           %
z1=1:k1;                           %
yz1max1=((max(zdsj1)-2048)/2048)*50;
yz1min1=((min(zdsj1)-2048)/2048)*50;
for i1=1:l1-1                      %matlab�����±��Ǵ�1��ʼ��
    j1=fix(i1/3)+1;                %ȡ�����1
    if mod(i1,3)==1               %�������
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
axis([0 k1 yz1min1 yz1max1])             %����X Y�����᷶Χ����ʽ�� axis([xmin xmax ymin ymax])
ylabel('��ֵ��g��')                 %Y�������ע
xlabel('��������')
legend('X��','Y��','Z��',3)      %ͼ����ע
title('�𶯲ɼ�����-��ֹ����')     %ͼ��ע
grid on
hold on


aaa2=hex2dec(aa2);                 %��16�����ļ�ת��Ϊ10����
zdsj2=aaa2(:)';                      %�з�תΪ��
l2=length(zdsj2);                    %�������鳤��
k2=l2/3;                           %
x2=1:k2;                           %
y2=1:k2;                           %
z2=1:k2;                           %
yz1max2=((max(zdsj2)-2048)/2048)*50;
yz1min2=((min(zdsj2)-2048)/2048)*50;
for i2=1:l2-1                      %matlab�����±��Ǵ�1��ʼ��
    j2=fix(i2/3)+1;                %ȡ�����1
    if mod(i2,3)==1               %�������
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
axis([0 k2 yz1min2 yz1max2])             %����X Y�����᷶Χ����ʽ�� axis([xmin xmax ymin ymax])
ylabel('��ֵ��g��')                 %Y�������ע
xlabel('��������')
legend('X��','Y��','Z��',3)      %ͼ����ע
title('�𶯲ɼ�����-��ֹƽ��')     %ͼ��ע
grid on
hold on


aaa3=hex2dec(aa3);                 %��16�����ļ�ת��Ϊ10����
zdsj3=aaa3(:)';                      %�з�תΪ��
l3=length(zdsj3);                    %�������鳤��
k3=l3/3;                           %
x3=1:k3;                           %
y3=1:k3;                           %
z3=1:k3;                           %
yz1max3=((max(zdsj3)-2048)/2048)*50;
yz1min3=((min(zdsj3)-2048)/2048)*50;
for i3=1:l3-1                      %matlab�����±��Ǵ�1��ʼ��
    j3=fix(i3/3)+1;                %ȡ�����1
    if mod(i3,3)==1               %�������
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
axis([0 k3 yz1min3 yz1max3])             %����X Y�����᷶Χ����ʽ�� axis([xmin xmax ymin ymax])
ylabel('��ֵ��g��')                 %Y�������ע
xlabel('��������')
legend('X��','Y��','Z��',3)      %ͼ����ע
title('�𶯲ɼ�����-��ƽ��')     %ͼ��ע
grid on
hold on


aaa4=hex2dec(aa4);                 %��16�����ļ�ת��Ϊ10����
zdsj4=aaa4(:)';                      %�з�תΪ��
l4=length(zdsj4);                    %�������鳤��
k4=l4/3;                           %
x4=1:k4;                           %
y4=1:k4;                           %
z4=1:k4;                           %
yz1max4=((max(zdsj4)-2048)/2048)*50;
yz1min4=((min(zdsj4)-2048)/2048)*50;
for i4=1:l4-1                      %matlab�����±��Ǵ�1��ʼ��
    j4=fix(i4/3)+1;                %ȡ�����1
    if mod(i4,3)==1               %�������
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
axis([0 k4 yz1min4 yz1max4])             %����X Y�����᷶Χ����ʽ�� axis([xmin xmax ymin ymax])
ylabel('��ֵ��g��')                 %Y�������ע
xlabel('��������')
legend('X��','Y��','Z��',3)      %ͼ����ע
title('�𶯲ɼ�����-��ֹ״̬��ƽ������')     %ͼ��ע
grid on
hold on



%����Ϊ��ͼģʽ����ͬ������Ա�
yz2max=20;
yz2min=-20;
figure;
subplot(2,2,1);
plot(n1,x1,'-r',n1,y1,'-b',n1,z1,'-g')
%axis([0 k1 yz1min1 yz1max1])             %����X Y�����᷶Χ����ʽ�� axis([xmin xmax ymin ymax])
axis([0 k1 yz2min yz2max])             %����X Y�����᷶Χ����ʽ�� axis([xmin xmax ymin ymax])
ylabel('��ֵ��g��')                 %Y�������ע
xlabel('��������')
legend('X��','Y��','Z��',3)      %ͼ����ע
title('�𶯲ɼ�����-��ֹ����')     %ͼ��ע
grid on
hold on

subplot(2,2,2);
plot(n2,x2,'-r',n2,y2,'-b',n2,z2,'-g')
%axis([0 k2 yz1min2 yz1max2])             %����X Y�����᷶Χ����ʽ�� axis([xmin xmax ymin ymax])
axis([0 k2 yz2min yz2max])             %����X Y�����᷶Χ����ʽ�� axis([xmin xmax ymin ymax])
ylabel('��ֵ��g��')                 %Y�������ע
xlabel('��������')
legend('X��','Y��','Z��',3)      %ͼ����ע
title('�𶯲ɼ�����-��ֹƽ��')     %ͼ��ע
grid on
hold on

subplot(2,2,3);
plot(n3,x3,'-r',n3,y3,'-b',n3,z3,'-g')
%axis([0 k3 yz1min3 yz1max3])             %����X Y�����᷶Χ����ʽ�� axis([xmin xmax ymin ymax])
axis([0 k3 yz2min yz2max])             %����X Y�����᷶Χ����ʽ�� axis([xmin xmax ymin ymax])
ylabel('��ֵ��g��')                 %Y�������ע
xlabel('��������')
legend('X��','Y��','Z��',3)      %ͼ����ע
title('�𶯲ɼ�����-��ƽ��')     %ͼ��ע
grid on
hold on

subplot(2,2,4);
plot(n4,x4,'-r',n4,y4,'-b',n4,z4,'-g')
%axis([0 k4 yz1min4 yz1max4])             %����X Y�����᷶Χ����ʽ�� axis([xmin xmax ymin ymax])
axis([0 k4 yz2min yz2max])             %����X Y�����᷶Χ����ʽ�� axis([xmin xmax ymin ymax])
ylabel('��ֵ��g��')                 %Y�������ע
xlabel('��������')
legend('X��','Y��','Z��',3)      %ͼ����ע
title('�𶯲ɼ�����-��ֹ״̬��ƽ������')     %ͼ��ע
grid on
hold on
