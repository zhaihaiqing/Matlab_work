%回调函数
%输入参数：pitch、roll、yaw，返回参数：端点坐标值
%已知初始向量[0,0,50],设备长度50cm
%设备的欧拉角（Pitch、Roll、Yaw/Azimuth）
%%
function PA=HCF1100_Position_Calculation(ax,ay,az,Torsion)

device_len=50;
A=[0;0;-device_len];    %单节设备在初始时的端点坐标

PRY=HCF1100_Euler_angle(ax,ay,az,Torsion);  %计算欧拉角
pitch=PRY(1,1)*pi/180;%转换为弧度
roll=PRY(1,2)*pi/180;
yaw=PRY(1,3)*pi/180;

%%定义Z->Y->X旋转矩阵
Rotate_x=[ 1,0,0; 0,cos(roll),-sin(roll); 0,sin(roll),cos(roll) ];%Roll
Rotate_y=[ cos(pitch),0,sin(pitch); 0,1,0; -sin(pitch),0,cos(pitch) ];%Pitch
Rotate_z=[ cos(yaw),-sin(yaw),0; sin(yaw),cos(yaw), 0;0,0,1 ];%Yaw
%%
M=Rotate_z*Rotate_y*Rotate_x;
%%
%N=inv(M);       %欧拉角定义的角度为逆时针旋转，HCF1100坐标系为顺时针，取逆矩阵
PA=M*A;          
PA(3,1)=-PA(3,1);

end

%根据加速度数据及扭转量计算欧拉角
function PRY=HCF1100_Euler_angle(ax,ay,az,Torsion)
    
    PRY=zeros(1,3);
    fai=Torsion*pi/180;
    accx=ax*cos(fai)-ay*sin(fai);
    accy=ax*sin(fai)+ay*cos(fai);
    accz=az;
    
    r=atan2(accy,accz);
    p=atan2(-accx, (accy*sin(r) + accz*cos(r)) );
    PRY(1,2)=r*180/pi;
    PRY(1,1)=p*180/pi;
    PRY(1,3)=0;
end



