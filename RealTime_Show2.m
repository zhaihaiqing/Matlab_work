
N=200;
h = animatedline;   %����һ����̬��
x = linspace(0,1000,1000);
y = sin(x);         %��������X�ĺ���
grid on;
for k = 1:length(x)
    addpoints(h,x(k),y(k));%ѭ����̬������ӵ�
    drawnow

    if k<N
        axis([0 N+N/50 -1.5 1.5]);
    else
        axis([k-N k+N/50 -1.5 1.5]);
    end
    pause(0.05);
end