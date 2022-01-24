%   串口的BytesAvailableFcn回调函数
function my_callback(obj,~,handles) 
global scom;
global RX_Count;
global PX1;
global PX2;
global PX3;
global PX4;

global PY1;
global PY2;
global PY3;
global PY4;

global PZ1;
global PZ2;
global PZ3;
global PZ4;

    fai3=0.786884*3.1415926/180;
    fai2=3.139303*3.1415926/180+fai3;
    fai1=-31.101019*3.1415926/180+fai2;
    fai1=0*3.1415926/180+fai2;
    %fai=0*3.1415926/180;
    
%% 接收串口发送过来的数据（这里有时会出现BUG，具体原因不详）
    %out=fscanf(scom,'%e',7)%以字符型获取数据
    out=fread(scom,109,'uchar');%以uchar型读取52个字节数据
    
    if out(1,1)==1
        datanum=84;
        PXb1=strcat(dec2hex(out(datanum,1),2),dec2hex(out(datanum+1,1),2),dec2hex(out(datanum+2,1),2),dec2hex(out(datanum+3,1),2));%字节拼接
        PXb1=hexsingle2num(PXb1)%将十六进制float型数据转换为十进制
        datanum=88;
        PYb1=strcat(dec2hex(out(datanum,1),2),dec2hex(out(datanum+1,1),2),dec2hex(out(datanum+2,1),2),dec2hex(out(datanum+3,1),2));%字节拼接
        PYb1=hexsingle2num(PYb1)%将十六进制float型数据转换为十进制
        datanum=92;
        PZb1=strcat(dec2hex(out(datanum,1),2),dec2hex(out(datanum+1,1),2),dec2hex(out(datanum+2,1),2),dec2hex(out(datanum+3,1),2));%字节拼接
        PZb1=hexsingle2num(PZb1)%将十六进制float型数据转换为十进制 
        
        PX1=PXb1*cos(fai1)-PYb1*sin(fai1)
        PY1=PXb1*sin(fai1)+PYb1*cos(fai1)
        PZ1=PZb1
        
        RX_Count=1;
    end
    
    if out(1,1)==2
        datanum=84;
        PXb2=strcat(dec2hex(out(datanum,1),2),dec2hex(out(datanum+1,1),2),dec2hex(out(datanum+2,1),2),dec2hex(out(datanum+3,1),2));%字节拼接
        PXb2=hexsingle2num(PXb2);%将十六进制float型数据转换为十进制
        datanum=88;
        PYb2=strcat(dec2hex(out(datanum,1),2),dec2hex(out(datanum+1,1),2),dec2hex(out(datanum+2,1),2),dec2hex(out(datanum+3,1),2));%字节拼接
        PYb2=hexsingle2num(PYb2);%将十六进制float型数据转换为十进制
        datanum=92;
        PZb2=strcat(dec2hex(out(datanum,1),2),dec2hex(out(datanum+1,1)v),dec2hex(out(datanum+2,1),2),dec2hex(out(datanum+3,1),2));%字节拼接
        PZb2=hexsingle2num(PZb2);%将十六进制float型数据转换为十进制 
        
        PX2=PXb2*cos(fai2)-PYb2*sin(fai2);
        PY2=PXb2*sin(fai2)+PYb2*cos(fai2);
        PZ2=PZb2;
        
        RX_Count=2;
    end
    
    if out(1,1)==3
        datanum=84;
        PXb3=strcat(dec2hex(out(datanum,1),2),dec2hex(out(datanum+1,1),2),dec2hex(out(datanum+2,1),2),dec2hex(out(datanum+3,1),2));%字节拼接
        PXb3=hexsingle2num(PXb3);%将十六进制float型数据转换为十进制
        datanum=88;
        PYb3=strcat(dec2hex(out(datanum,1),2),dec2hex(out(datanum+1,1),2),dec2hex(out(datanum+2,1),2),dec2hex(out(datanum+3,1),2));%字节拼接
        PYb3=hexsingle2num(PYb3);%将十六进制float型数据转换为十进制
        datanum=92;
        PZb3=strcat(dec2hex(out(datanum,1),2),dec2hex(out(datanum+1,1),2),dec2hex(out(datanum+2,1),2),dec2hex(out(datanum+3,1),2));%字节拼接
        PZb3=hexsingle2num(PZb3);%将十六进制float型数据转换为十进制 
        
        PX3=PXb3*cos(fai3)-PYb3*sin(fai3);
        PY3=PXb3*sin(fai3)+PYb3*cos(fai3);
        PZ3=PZb3;
        
        RX_Count=3;
    end
    
    if out(1,1)==4
        datanum=84;
        PX4=strcat(dec2hex(out(datanum,1),2),dec2hex(out(datanum+1,1),2),dec2hex(out(datanum+2,1),2),dec2hex(out(datanum+3,1),2));%字节拼接
        PX4=hexsingle2num(PX4);%将十六进制float型数据转换为十进制
        datanum=88;
        PY4=strcat(dec2hex(out(datanum,1),2),dec2hex(out(datanum+1,1),2),dec2hex(out(datanum+2,1),2),dec2hex(out(datanum+3,1),2));%字节拼接
        PY4=hexsingle2num(PY4);%将十六进制float型数据转换为十进制
        datanum=92;
        PZ4=strcat(dec2hex(out(datanum,1),2),dec2hex(out(datanum+1,1),2),dec2hex(out(datanum+2,1),2),dec2hex(out(datanum+3,1),2));%字节拼接
        PZ4=hexsingle2num(PZ4);%将十六进制float型数据转换为十进制 
        RX_Count=4;
    end
    
    
    if RX_Count==4  %四组数据接收完成
        
        RX_Count=0;
       
        x0=0*10;
        x1=PX1*10;
        x2=(PX1+PX2)*10;
        x3=(PX1+PX2+PX3)*10;
        x4=(PX1+PX2+PX3+PX4)*10;
        
        y0=0*10;
        y1=PY1*10;
        y2=(PY1+PY2)*10;
        y3=(PY1+PY2+PY3)*10;
        y4=(PY1+PY2+PY3+PY4)*10;
        
        z0=0*10;
        z1=PZ1*10;
        z2=(PZ1+PZ2)*10;
        z3=(PZ1+PZ2+PZ3)*10;
        z4=(PZ1+PZ2+PZ3+PZ4)*10;
        
        clc;
        X=[x0,x1,x2,x3,x4];
        Y=[y0,y1,y2,y3,y4];
        Z=[z0,z1,z2,z3,z4];
        
        set(handles.edit1,'string',x0);   %在edit3中展示元胞数组
        set(handles.edit2,'string',x1);   %在edit3中展示元胞数组
        set(handles.edit3,'string',x2);   %在edit3中展示元胞数组
        set(handles.edit4,'string',x3);   %在edit3中展示元胞数组
        set(handles.edit5,'string',x4);   %在edit3中展示元胞数组
        
        set(handles.edit6,'string',y0);   %在edit3中展示元胞数组
        set(handles.edit7,'string',y1);   %在edit3中展示元胞数组
        set(handles.edit8,'string',y2);   %在edit3中展示元胞数组
        set(handles.edit9,'string',y3);   %在edit3中展示元胞数组
        set(handles.edit10,'string',y4);   %在edit3中展示元胞数组
        
        set(handles.edit11,'string',z0);   %在edit3中展示元胞数组
        set(handles.edit12,'string',z1);   %在edit3中展示元胞数组
        set(handles.edit13,'string',z2);   %在edit3中展示元胞数组
        set(handles.edit14,'string',z3);   %在edit3中展示元胞数组
        set(handles.edit15,'string',z4);   %在edit3中展示元胞数组
       
        
        %cla reset
        cla
        plot3(X,Y,Z,'-b*','LineWidth',2);
        axis([-2000 2000 -2000 2000 -2000 2000]);
        xlabel('X轴-主方向-mm');ylabel('Y轴-次方向-mm');zlabel('Z轴-竖向-mm');
        hold on
        grid on
        rotate3d on
        
    end 
end
    
    
%     
%     
%     ACC_X=strcat(dec2hex(out(14,1)),dec2hex(out(15,1)),dec2hex(out(16,1)),dec2hex(out(17,1)));%字节拼接
%     ACC_X=hexsingle2num(ACC_X);%将十六进制float型数据转换为十进制
%     ACC_Y=strcat(dec2hex(out(18,1)),dec2hex(out(19,1)),dec2hex(out(20,1)),dec2hex(out(21,1)));%字节拼接
%     ACC_Y=hexsingle2num(ACC_Y);%将十六进制float型数据转换为十进制
%     ACC_Z=strcat(dec2hex(out(22,1)),dec2hex(out(23,1)),dec2hex(out(24,1)),dec2hex(out(25,1)));%字节拼接
%     ACC_Z=hexsingle2num(ACC_Z);%将十六进制float型数据转换为十进制
%     MAG_X=strcat(dec2hex(out(30,1)),dec2hex(out(31,1)),dec2hex(out(32,1)),dec2hex(out(33,1)));%字节拼接
%     MAG_X=hexsingle2num(MAG_X);%将十六进制float型数据转换为十进制
%     MAG_Y=strcat(dec2hex(out(34,1)),dec2hex(out(35,1)),dec2hex(out(36,1)),dec2hex(out(37,1)));%字节拼接
%     MAG_Y=hexsingle2num(MAG_Y);%将十六进制float型数据转换为十进制
%     MAG_Z=strcat(dec2hex(out(38,1)),dec2hex(out(39,1)),dec2hex(out(40,1)),dec2hex(out(41,1)));%字节拼接
%     MAG_Z=hexsingle2num(MAG_Z);%将十六进制float型数据转换为十进制
%     ACC_g=[ACC_X ACC_Y ACC_Z]
%     MAG_uT=[MAG_X MAG_Y MAG_Z]
%     P=strcat(dec2hex(out(60,1)),dec2hex(out(61,1)),dec2hex(out(62,1)),dec2hex(out(63,1)));%字节拼接
%     Pitch=hexsingle2num(P);%将十六进制float型数据转换为十进制
%     R=strcat(dec2hex(out(64,1)),dec2hex(out(65,1)),dec2hex(out(66,1)),dec2hex(out(67,1)));
%     Roll=hexsingle2num(R);
%     Y=strcat(dec2hex(out(68,1)),dec2hex(out(69,1)),dec2hex(out(70,1)),dec2hex(out(71,1)));
%     Yaw=hexsingle2num(Y);
%     PRY_angle=[Pitch,Roll,Yaw]
%     PA=HCF1100_Euler(Pitch,Roll,0);%调用欧拉角公式，求解坐标
%     PA1=PA'
%     x2=0;y2=0;z2=0;
%     
%     X=[PA(1,1),x2];
%     Y=[PA(2,1),y2];
%     Z=[PA(3,1),z2];
%     
% %%    
% %     axes(handles.axes1);
% %     grid on
% %     hold on
% %     XYmax=RX_Count
% %     if XYmax<=50
% %         XYmax=50;XYmin=0;
% %     else
% %         XYmin=XYmax-50;
% %     end
% %     plot(RX_Count,Pitch);
% %     plot(RX_Count,Roll,'r--*');
% %     %set(gca,'Xlim',[XYmin,XYmax]);
% %%  
%     %3D 绘图
%     axes(handles.axes1); 
%     h = get(handles.axes1, 'children'); % 获取坐标轴的children属性
%     cla(h);%清除之前图形中的画图
%     grid on;
%     hold on;
%     plot3(X,Y,Z,'-b*','LineWidth',2);
%     
%     X=[PA(1,1),PA(1,1)];
%     Y=[PA(2,1),PA(2,1)];
%     Z=[0,PA(3,1)];
%     plot3(X,Y,Z,'r--.','LineWidth',0.5);
%     X=[0,PA(1,1)];
%     Y=[PA(2,1),PA(2,1)];
%     Z=[0,0];
%     plot3(X,Y,Z,'g--.','LineWidth',0.5);
%     X=[PA(1,1),PA(1,1)];
%     Y=[0,PA(2,1)];
%     Z=[0,0];
%     plot3(X,Y,Z,'m--.','LineWidth',0.5);
%     
%     
%     set(gca,'Xlim',[-device_len,device_len]);
%     set(gca,'Ylim',[-device_len,device_len]);
%     set(gca,'Zlim',[0,device_len]);
%     xlabel('X轴');
%     ylabel('Y轴');
%     zlabel('Z轴');
%     
%     
%     
% end
