%���𶯲ɼ��ɵõ�16��������ת��Ϊʮ���ƣ���Ϊx��y��z������������
%������ͬһ����������ʾ����
close all;
clc;
aa1=textread('E:\HD\�𶯲ɼ�\�𶯲ɼ�����\���������°�\zd��ֹ.TXT','%s');   %�Է��ŵ���ʽ����16�����ļ�    ����ʱ��dlmwrite('filename.txt',a)
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
axis([0 k1 yz1min1 yz1max1])             %����X Y�����᷶Χ����ʽ�� axis([xmin xmax ymin ymax])
ylabel('��ֵ��g��')                 %Y�������ע
xlabel('��������')
legend('X��','Y��','Z��',3)      %ͼ����ע
title('�𶯲ɼ�����-��ֹ����')     %ͼ��ע
grid on
hold on


