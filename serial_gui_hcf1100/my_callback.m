%   串口的BytesAvailableFcn回调函数
function my_callback(obj,~,handles) 
    global scom;
    global RX_Count;
    global Pitch;
%% 接收串口发送过来的数据（这里有时会出现BUG，具体原因不详）
    %out=fscanf(scom,'%e',7)%以字符型获取数据
    RX_Count=1+RX_Count;
    out=fread(scom,12,'uchar');%以uchar型读取12个字节数据
    P=strcat(dec2hex(out(1,1)),dec2hex(out(2,1)),dec2hex(out(3,1)),dec2hex(out(4,1)));%字节拼接
    Pitch=hexsingle2num(P);%将十六进制float型数据转换为十进制
    R=strcat(dec2hex(out(5,1)),dec2hex(out(6,1)),dec2hex(out(7,1)),dec2hex(out(8,1)));
    Roll=hexsingle2num(R);
    Y=strcat(dec2hex(out(9,1)),dec2hex(out(10,1)),dec2hex(out(11,1)),dec2hex(out(12,1)));
    Yaw=hexsingle2num(Y);
    PRY=[Pitch,Roll,Yaw]
    PA=HCF1100_Euler(Pitch,Roll,Yaw)%调用欧拉角公式，求解坐标
   
    x2=0;y2=0;z2=0;
    
    X=[x2,PA(1,1)];
    Y=[y2,PA(2,1)];
    Z=[z2,PA(3,1)];
    
%     axes(handles.axes1);  
%     plot(RX_Count,Pitch,'--r*');
%     plot(RX_Count,Roll,'--b*');
%     hold on
%     grid on
    
    %3D 绘图
    axes(handles.axes1); 
    h = get(handles.axes1, 'children'); % 获取坐标轴的children属性
    cla(h);%清除之前图形中的画图
    grid on;
    hold on;
    plot3(X,Y,Z,'-b*','LineWidth',2);
    
    X=[PA(1,1),PA(1,1)];
    Y=[PA(2,1),PA(2,1)];
    Z=[0,PA(3,1)];
    plot3(X,Y,Z,'r--.','LineWidth',0.5);
    X=[0,PA(1,1)];
    Y=[PA(2,1),PA(2,1)];
    Z=[0,0];
    plot3(X,Y,Z,'g--.','LineWidth',0.5);
    X=[PA(1,1),PA(1,1)];
    Y=[0,PA(2,1)];
    Z=[0,0];
    plot3(X,Y,Z,'m--.','LineWidth',0.5);
    
    
    set(gca,'Xlim',[-50,50]);
    set(gca,'Ylim',[-50,50]);
    set(gca,'Zlim',[0,50]);
    xlabel('X轴');
    ylabel('Y轴');
    zlabel('Z轴');
    
    
    
end
