%回调函数
%输入参数：pitch、roll、yaw，返回参数：端点坐标值
%已知初始向量[0,0,50],设备长度50cm
%设备的欧拉角（Pitch、Roll、Yaw/Azimuth）
%%
function PA=HCF1100_Euler(pitch,roll,yaw,device_len)

%PI=3.141592653589793;           %定义PI
PI=pi;
A=[0;0;-device_len];    %单节设备在初始时的端点坐标
yaw=yaw*PI/180;         %转换为弧度
pitch=pitch*PI/180;
roll=roll*PI/180;
%%
Rotate_x=[ 1,0,0; 0,cos(roll),-sin(roll); 0,sin(roll),cos(roll) ];%Roll
Rotate_y=[ cos(pitch),0,sin(pitch); 0,1,0; -sin(pitch),0,cos(pitch) ];%Pitch
Rotate_z=[ cos(yaw),-sin(yaw),0; sin(yaw),cos(yaw), 0;0,0,1 ];%Yaw
%%
M=Rotate_z*Rotate_y*Rotate_x;
%%
%N=inv(M);       %欧拉角定义的角度为逆时针旋转，HCF1100坐标系为顺时针，取逆矩阵
PA=M*A;          
PA(3,1)=-PA(3,1);




