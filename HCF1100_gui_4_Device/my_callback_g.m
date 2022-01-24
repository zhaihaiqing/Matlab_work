%   串口的BytesAvailableFcn回调函数
function my_callback(obj,~,handles) 
global scom;
global RX_Count;

global P1;
global P2;
global P3;
global P4;

global addr1;
global addr2;
global addr3;
global addr4;

%global fileID;

global ax1;
global ax2;
global ax3;
global ax4;

global ay1;
global ay2;
global ay3;
global ay4;

global az1;
global az2;
global az3;
global az4;

global x1;
global x2;
global x3;
global x4;

global y1;
global y2;
global y3;
global y4;

global z1;
global z2;
global z3;
global z4;

%% 接收串口发送过来的数据（这里有时会出现BUG，具体原因不详）
    out=fread(scom,109,'uchar');%以uchar型读取52个字节数据
    
    
    Torsion4=0;
    Torsion3=-179.8489431+Torsion4;
    Torsion2=-5.017389468+Torsion3;
    Torsion1=-215.9952112+Torsion2;
    
%     fai4=0;
%     fai3=0*pi/180+fai4;
%     fai2=0*pi/180+fai3;
%     fai1=0*pi/180+fai2;
  
    
    if out(1,1)==addr1
        [ax1,ay1,az1]=HCF1100_ACC_Cat(out);
        P1=HCF1100_Position_Calculation(ax1,ay1,az1,Torsion1);
        RX_Count=1;
    end
    if out(1,1)==addr2
        [ax2,ay2,az2]=HCF1100_ACC_Cat(out);
        P2=HCF1100_Position_Calculation(ax2,ay2,az2,Torsion2);        
        RX_Count=2;
    end
    if out(1,1)==addr3
        [ax3,ay3,az3]=HCF1100_ACC_Cat(out);
        P3=HCF1100_Position_Calculation(ax3,ay3,az3,Torsion3);
        RX_Count=3;
    end
    if out(1,1)==addr4
        [ax4,ay4,az4]=HCF1100_ACC_Cat(out);
        P4=HCF1100_Position_Calculation(ax4,ay4,az4,Torsion4);
        RX_Count=4;
    end
        
    if RX_Count==4;
        RX_Count=0;
        PX1=P1(1,1);PY1=P1(2,1);PZ1=P1(3,1);
        PX2=P2(1,1);PY2=P2(2,1);PZ2=P2(3,1);
        PX3=P3(1,1);PY3=P3(2,1);PZ3=P3(3,1);
        PX4=P4(1,1);PY4=P4(2,1);PZ4=P4(3,1);
        
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
        
        if ~exist('HCF1100_Longterm.xlsx','file')
             header={'时间','a1x','a1y','a1z','a2x','a2y','a2z','a3x','a3y','a3z','a4x','a4y','a4z','p1x','p1y','p1z','p2x','p2y','p2z','p3x','p3y','p3z','p4x','p4y','p4z'};
             xlswrite('HCF1100_Longterm.xlsx',header,'Sheet1','A1');
        else
            [tmp1,tmp2,tmpRaw]=xlsread('HCF1100_Longterm.xlsx');
            if size(tmp1,1)==0 && size(tmp2,1)==0
                mRowRange='1';
            else
                mRowRange=num2str(size(tmpRaw,1)+1);
            end
            Row=strcat('A',mRowRange);
            dt=datestr(datetime);
            header2={dt,ax1,ay1,az1,ax2,ay2,az2,ax3,ay3,az3,ax4,ay4,az4,x1,y1,z1,x2,y2,z2,x3,y3,z3,x4,y4,z4};
            xlswrite('HCF1100_Longterm.xlsx',header2,'Sheet1',Row);
        end
        
        
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
        axis([-2000 2000 -2000 2000 0 2000]);
        xlabel('X轴-主方向-mm');ylabel('Y轴-次方向-mm');zlabel('Z轴-竖向-mm');
        hold on
        grid on
        rotate3d on
  
    end
end
       
        
        
        
        
        
        
        

        
