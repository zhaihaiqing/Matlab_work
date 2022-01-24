%%%本程序在于分析HCF800测试数据，
%%%读入excel数据，然后将图做出来
i=0;
N=3;%excel表格中sheet数量

for k=1:N
    
    i=i+1;
    figure;
    %读入excel表格第 i 个sheet
    [data] = xlsread('C:\Users\haiqing\Desktop\HCF800测试数据\数据.xlsx',i);
    lx=length(data);%计算数据长度
    at=data(1:lx,1);%读取第一列数据
    
    %在此处对高度值添加滑动滤波器，删除坏点
    
    temp=data(1:lx,2);%读取第二列数据
    x=(1:1:lx);
    maxat=max(at);
    minat=min(at);
    maxtemp=max(temp);
    mintemp=min(temp);
 
    [ax,h1,h2] = plotyy(x,at,x,temp);%绘制双Y轴曲线
    %set(ax(1),'ylim',[min_axis,max_axis]);
    set(ax(1),'yTick',[minat:2:maxat]);
    set(ax(2),'yTick',[mintemp:2:maxtemp]);
    grid on
    xlabel('采样次数');                                 %x轴说明
    set(get(ax(1),'Ylabel'),'String','高度值（mm）');   %y1轴说明
    set(get(ax(2),'Ylabel'),'String','温度值（℃）');   %y2轴说明
    title(['高度值随温度变化曲线',num2str(i)]);         %添加title
    
end
