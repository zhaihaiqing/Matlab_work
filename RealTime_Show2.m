
N=200;
h = animatedline;   %创建一个动态线
x = linspace(0,1000,1000);
y = sin(x);         %创建关于X的函数
grid on;
for k = 1:length(x)
    addpoints(h,x(k),y(k));%循环向动态线中添加点
    drawnow

    if k<N
        axis([0 N+N/50 -1.5 1.5]);
    else
        axis([k-N k+N/50 -1.5 1.5]);
    end
    pause(0.05);
end