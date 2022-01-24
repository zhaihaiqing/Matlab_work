%�ص�����
%���������pitch��roll��yaw�����ز������˵�����ֵ
%��֪��ʼ����[0,0,50],�豸����50cm
%�豸��ŷ���ǣ�Pitch��Roll��Yaw/Azimuth��
%%
function PA=HCF1100_Position_Calculation(ax,ay,az,Torsion)

device_len=50;
A=[0;0;-device_len];    %�����豸�ڳ�ʼʱ�Ķ˵�����

PRY=HCF1100_Euler_angle(ax,ay,az,Torsion);  %����ŷ����
pitch=PRY(1,1)*pi/180;%ת��Ϊ����
roll=PRY(1,2)*pi/180;
yaw=PRY(1,3)*pi/180;

%%����Z->Y->X��ת����
Rotate_x=[ 1,0,0; 0,cos(roll),-sin(roll); 0,sin(roll),cos(roll) ];%Roll
Rotate_y=[ cos(pitch),0,sin(pitch); 0,1,0; -sin(pitch),0,cos(pitch) ];%Pitch
Rotate_z=[ cos(yaw),-sin(yaw),0; sin(yaw),cos(yaw), 0;0,0,1 ];%Yaw
%%
M=Rotate_z*Rotate_y*Rotate_x;
%%
%N=inv(M);       %ŷ���Ƕ���ĽǶ�Ϊ��ʱ����ת��HCF1100����ϵΪ˳ʱ�룬ȡ�����
PA=M*A;          
PA(3,1)=-PA(3,1);

end

%���ݼ��ٶ����ݼ�Ťת������ŷ����
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



