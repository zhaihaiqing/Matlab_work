%�ص�����
%���������pitch��roll��yaw�����ز������˵�����ֵ
%��֪��ʼ����[0,0,50],�豸����50cm
%�豸��ŷ���ǣ�Pitch��Roll��Yaw/Azimuth��
%%
function PA=HCF1100_Euler(pitch,roll,yaw)
PI=3.1415926;           %����PI
A=[0;0;-14.2];              %�����豸�ڳ�ʼʱ�Ķ˵�����
yaw=yaw*PI/180         %ת��Ϊ����
pitch=pitch*PI/180
roll=roll*PI/180

C1=cos(yaw);C2=cos(pitch);C3=cos(roll);
S1=sin(yaw);S2=sin(pitch);S3=sin(roll);

%% ʹ��̩�ز������ǣ�ŷ���ǵ�һ����ʽ������ת˳��Z->X->Y
% r11=cos(yaw)*cos(pitch)-sin(yaw)*sin(roll)*sin(pitch);
% r12=-sin(yaw)*cos(roll);
% r13=cos(yaw)*sin(pitch)+sin(yaw)*sin(roll)*cos(pitch);
% r21=sin(yaw)*cos(pitch)+cos(yaw)*sin(roll)*sin(pitch);
% r22=cos(yaw)*cos(roll);
% r23=sin(yaw)*sin(pitch)-cos(yaw)*sin(roll)*cos(pitch);
% r31=-cos(roll)*sin(pitch);
% r32=sin(roll);
% r33=cos(roll)*cos(pitch);

%% ʹ��̩�ز������ǣ�ŷ���ǵ�һ����ʽ������ת˳��Z->Y->X
r11=C1*C2;
r12=C1*S2*S3-C3*S1;
r13=S1*S3+C1*C3*S2;
r21=C2*S1;
r22=C1*C3+S1*S2*S3;
r23=C3*S1*S2-C1*S3;
r31=-S2;
r32=C2*S3;
r33=C2*C3;
%% ʹ��̩�ز������ǣ�ŷ���ǵ�һ����ʽ������ת˳��Y->X->Z
% r11=C1*C3+S1*S2*S3;
% r12=C3*S1*S2-C1*S3;
% r13=C2*S1;
% r21=C2*S3;
% r22=C2*C3;
% r23=-S2;
% r31=C1*S2*S3-C3*S1;
% r32=C1*C3*S2+S1*S3;
% r33=C1*C2;

%% ʹ��̩�ز������ǣ�ŷ���ǵ�һ����ʽ������ת˳��Y->Z->X
% r11=C1*C2;
% r12=S1*S3-C1*C3*S2;
% r13=C3*S1+C1*S2*S3;
% r21=S2;
% r22=C2*C3;
% r23=-C2*S3;
% r31=-C2*S1;
% r32=C1*S3+C3*S1*S2;
% r33=C1*C3-S1*S2*S3;

%% ʹ��̩�ز������ǣ�ŷ���ǵ�һ����ʽ������ת˳��X->Z->Y
% r11=C2*C3;
% r12=-S2;
% r13=C2*S3;
% r21=S1*S3+C1*C3*S2;
% r22=C1*C2;
% r23=C1*S2*S3-C3*S1;
% r31=C3*S1*S2-C1*S3;
% r32=C2*S1;
% r33=C1*C3+S1*S2*S3;

%% ʹ��̩�ز������ǣ�ŷ���ǵ�һ����ʽ������ת˳��X->Y->Z
% r11=C2*C3;
% r12=-C2*S3;
% r13=S2;
% r21=C1*S3+C3*S1*S2;
% r22=C1*C3-S1*S2*S3;
% r23=-C2*S1;
% r31=S1*S3-C1*C3*S2;
% r32=C3*S1+C1*S2*S3;
% r33=C1*C2;

% Rotate_x=[ 1,0,0; 0,cos(roll),sin(roll); 0,-sin(roll),cos(roll) ];%Roll
% Rotate_y=[ cos(pitch),0,-sin(pitch); 0,1,0; sin(pitch),0,cos(pitch) ];%Pitch
% Rotate_z=[ cos(yaw),sin(yaw),0; -sin(yaw),cos(yaw), 0;0,0,1 ];%Yaw

Rotate_x=[ 1,0,0; 0,cos(roll),-sin(roll); 0,sin(roll),cos(roll) ];%Roll
Rotate_y=[ cos(pitch),0,sin(pitch); 0,1,0; -sin(pitch),0,cos(pitch) ];%Pitch
Rotate_z=[ cos(yaw),-sin(yaw),0; sin(yaw),cos(yaw), 0;0,0,1 ];%Yaw


M=[r11,r12,r13;r21,r22,r23;r31,r32,r33];
%M=Rotate_z*Rotate_y*Rotate_x

% buf=roll;
% roll=pitch;
% pitch=buf;
%  
%  Mzxy=Mz*My*Mx;
%  N1=inv(Mzxy)

%N=inv(M);       %ŷ���Ƕ���ĽǶ�Ϊ��ʱ����ת��HCF1100����ϵΪ˳ʱ�룬ȡ�����
PA=M*A;          
%PA(1,1)=-PA(1,1);
%PA(2,1)=-PA(2,1);
%PA              %PA��Ϊ���������
% 
% grid on;
% hold on;
% plot3([0,PA(1,1)],[0,PA(1,2)],[0,PA(1,3)],'-*');
% set(gca,'Xlim',[-50,50]);
% set(gca,'Ylim',[-50,50]);
% set(gca,'Zlim',[0,50]);
% xlabel('X��');
% ylabel('Y��');
% zlabel('Z��');



