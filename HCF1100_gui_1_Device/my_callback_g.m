%   串口的BytesAvailableFcn回调函数
function my_callback(obj,~,handles) 
global scom;
global RX_Count;

global accx1;
global accy1;
global accz1;

global accx2;
global accy2;
global accz2;


global accx3;
global accy3;
global accz3;


global accx4;
global accy4;
global accz4;


%     fai3=0.786884*pi/180;
%     fai2=3.139303*pi/180+fai3;
   % fai1=-31.101019*pi/180+fai2;
    fai=0;
    fai1=fai*3.1415926/180;
     
%% 接收串口发送过来的数据（这里有时会出现BUG，具体原因不详）
    out=fread(scom,109,'uchar');%以uchar型读取52个字节数据
    
    
        datanum=14;
        ax1=strcat(dec2hex(out(datanum,1),2),dec2hex(out(datanum+1,1),2),dec2hex(out(datanum+2,1),2),dec2hex(out(datanum+3,1),2));%字节拼接
        ax1=hexsingle2num(ax1)%将十六进制float型数据转换为十进制
        datanum=18;
        ay1=strcat(dec2hex(out(datanum,1),2),dec2hex(out(datanum+1,1),2),dec2hex(out(datanum+2,1),2),dec2hex(out(datanum+3,1),2));%字节拼接
        ay1=hexsingle2num(ay1)%将十六进制float型数据转换为十进制
        datanum=22;
        az1=strcat(dec2hex(out(datanum,1),2),dec2hex(out(datanum+1,1),2),dec2hex(out(datanum+2,1),2),dec2hex(out(datanum+3,1),2));%字节拼接
        az1=hexsingle2num(az1)%将十六进制float型数据转换为十进制 
        
        accx1=ax1*cos(fai1)-ay1*sin(fai1);
        accy1=ax1*sin(fai1)+ay1*cos(fai1);
        accz1=az1;
        
 
        
        roll=atan2(accy1,accz1);
        pitch=atan2(-accx1, (accy1*sin(roll) + accz1*cos(roll)) );
        roll=roll*180/3.1415926;
        pitch=pitch*180/3.1415926;
        PA1=HCF1100_Euler(pitch,roll,0,50)
        
       
        
        PX1=PA1(1,1);
        PY1=PA1(2,1);
        PZ1=PA1(3,1);
        
      
       
        
        x0=0*10;
        x1=PX1*10;
 
        
        y0=0*10;
        y1=PY1*10;
       
        
        z0=0*10;
        z1=PZ1*10;
       
        
        %clc;
        X=[x0,x1];
        Y=[y0,y1];
        Z=[z0,z1];
        
        set(handles.edit1,'string',x0);   %在edit3中展示元胞数组
        set(handles.edit2,'string',x1);   %在edit3中展示元胞数组
      
        
        set(handles.edit6,'string',y0);   %在edit3中展示元胞数组
        set(handles.edit7,'string',y1);   %在edit3中展示元胞数组
       
        
        set(handles.edit11,'string',z0);   %在edit3中展示元胞数组
        set(handles.edit12,'string',z1);   %在edit3中展示元胞数组
       
       
        
        %cla reset
        cla
        plot3(X,Y,Z,'-b*','LineWidth',2);
        axis([-500 500 -500 500 -500 500]);
        xlabel('X轴-主方向-mm');ylabel('Y轴-次方向-mm');zlabel('Z轴-竖向-mm');
        hold on
        grid on
        rotate3d on
        
   
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
