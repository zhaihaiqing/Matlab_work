%�ź�y1
t=0:0.001:pi;
u1=2;
w1=1.5;
y1=u1*sin(2*pi*t*w1);
subplot(3,1,1)
plot(t,y1);

%�ز��ź�
u2=2;
w2=50;
y2=u2*sin(2*pi*t*w2);
subplot(3,1,2)
plot(t,y2);

%���Ʋ��ź�
y=(5+y1).*y2;

%ϣ�����ر任�������
h=hilbert(y);
subplot(3,1,3)
plot(t,y,t,abs(h),t,-abs(h));

