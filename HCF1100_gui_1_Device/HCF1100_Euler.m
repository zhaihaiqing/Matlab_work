%�ص�����
%���������pitch��roll��yaw�����ز������˵�����ֵ
%��֪��ʼ����[0,0,50],�豸����50cm
%�豸��ŷ���ǣ�Pitch��Roll��Yaw/Azimuth��
%%
function PA=HCF1100_Euler(pitch,roll,yaw,device_len)

%PI=3.141592653589793;           %����PI
PI=pi;
A=[0;0;-device_len];    %�����豸�ڳ�ʼʱ�Ķ˵�����
yaw=yaw*PI/180;         %ת��Ϊ����
pitch=pitch*PI/180;
roll=roll*PI/180;
%%
Rotate_x=[ 1,0,0; 0,cos(roll),-sin(roll); 0,sin(roll),cos(roll) ];%Roll
Rotate_y=[ cos(pitch),0,sin(pitch); 0,1,0; -sin(pitch),0,cos(pitch) ];%Pitch
Rotate_z=[ cos(yaw),-sin(yaw),0; sin(yaw),cos(yaw), 0;0,0,1 ];%Yaw
%%
M=Rotate_z*Rotate_y*Rotate_x;
%%
%N=inv(M);       %ŷ���Ƕ���ĽǶ�Ϊ��ʱ����ת��HCF1100����ϵΪ˳ʱ�룬ȡ�����
PA=M*A;          
PA(3,1)=-PA(3,1);




