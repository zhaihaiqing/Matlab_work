%   ���ڵ�BytesAvailableFcn�ص�����
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
    
%% ���մ��ڷ��͹��������ݣ�������ʱ�����BUG������ԭ���꣩
    %out=fscanf(scom,'%e',7)%���ַ��ͻ�ȡ����
    out=fread(scom,109,'uchar');%��uchar�Ͷ�ȡ52���ֽ�����
    
    if out(1,1)==1
        datanum=84;
        PXb1=strcat(dec2hex(out(datanum,1),2),dec2hex(out(datanum+1,1),2),dec2hex(out(datanum+2,1),2),dec2hex(out(datanum+3,1),2));%�ֽ�ƴ��
        PXb1=hexsingle2num(PXb1)%��ʮ������float������ת��Ϊʮ����
        datanum=88;
        PYb1=strcat(dec2hex(out(datanum,1),2),dec2hex(out(datanum+1,1),2),dec2hex(out(datanum+2,1),2),dec2hex(out(datanum+3,1),2));%�ֽ�ƴ��
        PYb1=hexsingle2num(PYb1)%��ʮ������float������ת��Ϊʮ����
        datanum=92;
        PZb1=strcat(dec2hex(out(datanum,1),2),dec2hex(out(datanum+1,1),2),dec2hex(out(datanum+2,1),2),dec2hex(out(datanum+3,1),2));%�ֽ�ƴ��
        PZb1=hexsingle2num(PZb1)%��ʮ������float������ת��Ϊʮ���� 
        
        PX1=PXb1*cos(fai1)-PYb1*sin(fai1)
        PY1=PXb1*sin(fai1)+PYb1*cos(fai1)
        PZ1=PZb1
        
        RX_Count=1;
    end
    
    if out(1,1)==2
        datanum=84;
        PXb2=strcat(dec2hex(out(datanum,1),2),dec2hex(out(datanum+1,1),2),dec2hex(out(datanum+2,1),2),dec2hex(out(datanum+3,1),2));%�ֽ�ƴ��
        PXb2=hexsingle2num(PXb2);%��ʮ������float������ת��Ϊʮ����
        datanum=88;
        PYb2=strcat(dec2hex(out(datanum,1),2),dec2hex(out(datanum+1,1),2),dec2hex(out(datanum+2,1),2),dec2hex(out(datanum+3,1),2));%�ֽ�ƴ��
        PYb2=hexsingle2num(PYb2);%��ʮ������float������ת��Ϊʮ����
        datanum=92;
        PZb2=strcat(dec2hex(out(datanum,1),2),dec2hex(out(datanum+1,1)v),dec2hex(out(datanum+2,1),2),dec2hex(out(datanum+3,1),2));%�ֽ�ƴ��
        PZb2=hexsingle2num(PZb2);%��ʮ������float������ת��Ϊʮ���� 
        
        PX2=PXb2*cos(fai2)-PYb2*sin(fai2);
        PY2=PXb2*sin(fai2)+PYb2*cos(fai2);
        PZ2=PZb2;
        
        RX_Count=2;
    end
    
    if out(1,1)==3
        datanum=84;
        PXb3=strcat(dec2hex(out(datanum,1),2),dec2hex(out(datanum+1,1),2),dec2hex(out(datanum+2,1),2),dec2hex(out(datanum+3,1),2));%�ֽ�ƴ��
        PXb3=hexsingle2num(PXb3);%��ʮ������float������ת��Ϊʮ����
        datanum=88;
        PYb3=strcat(dec2hex(out(datanum,1),2),dec2hex(out(datanum+1,1),2),dec2hex(out(datanum+2,1),2),dec2hex(out(datanum+3,1),2));%�ֽ�ƴ��
        PYb3=hexsingle2num(PYb3);%��ʮ������float������ת��Ϊʮ����
        datanum=92;
        PZb3=strcat(dec2hex(out(datanum,1),2),dec2hex(out(datanum+1,1),2),dec2hex(out(datanum+2,1),2),dec2hex(out(datanum+3,1),2));%�ֽ�ƴ��
        PZb3=hexsingle2num(PZb3);%��ʮ������float������ת��Ϊʮ���� 
        
        PX3=PXb3*cos(fai3)-PYb3*sin(fai3);
        PY3=PXb3*sin(fai3)+PYb3*cos(fai3);
        PZ3=PZb3;
        
        RX_Count=3;
    end
    
    if out(1,1)==4
        datanum=84;
        PX4=strcat(dec2hex(out(datanum,1),2),dec2hex(out(datanum+1,1),2),dec2hex(out(datanum+2,1),2),dec2hex(out(datanum+3,1),2));%�ֽ�ƴ��
        PX4=hexsingle2num(PX4);%��ʮ������float������ת��Ϊʮ����
        datanum=88;
        PY4=strcat(dec2hex(out(datanum,1),2),dec2hex(out(datanum+1,1),2),dec2hex(out(datanum+2,1),2),dec2hex(out(datanum+3,1),2));%�ֽ�ƴ��
        PY4=hexsingle2num(PY4);%��ʮ������float������ת��Ϊʮ����
        datanum=92;
        PZ4=strcat(dec2hex(out(datanum,1),2),dec2hex(out(datanum+1,1),2),dec2hex(out(datanum+2,1),2),dec2hex(out(datanum+3,1),2));%�ֽ�ƴ��
        PZ4=hexsingle2num(PZ4);%��ʮ������float������ת��Ϊʮ���� 
        RX_Count=4;
    end
    
    
    if RX_Count==4  %�������ݽ������
        
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
        
        set(handles.edit1,'string',x0);   %��edit3��չʾԪ������
        set(handles.edit2,'string',x1);   %��edit3��չʾԪ������
        set(handles.edit3,'string',x2);   %��edit3��չʾԪ������
        set(handles.edit4,'string',x3);   %��edit3��չʾԪ������
        set(handles.edit5,'string',x4);   %��edit3��չʾԪ������
        
        set(handles.edit6,'string',y0);   %��edit3��չʾԪ������
        set(handles.edit7,'string',y1);   %��edit3��չʾԪ������
        set(handles.edit8,'string',y2);   %��edit3��չʾԪ������
        set(handles.edit9,'string',y3);   %��edit3��չʾԪ������
        set(handles.edit10,'string',y4);   %��edit3��չʾԪ������
        
        set(handles.edit11,'string',z0);   %��edit3��չʾԪ������
        set(handles.edit12,'string',z1);   %��edit3��չʾԪ������
        set(handles.edit13,'string',z2);   %��edit3��չʾԪ������
        set(handles.edit14,'string',z3);   %��edit3��չʾԪ������
        set(handles.edit15,'string',z4);   %��edit3��չʾԪ������
       
        
        %cla reset
        cla
        plot3(X,Y,Z,'-b*','LineWidth',2);
        axis([-2000 2000 -2000 2000 -2000 2000]);
        xlabel('X��-������-mm');ylabel('Y��-�η���-mm');zlabel('Z��-����-mm');
        hold on
        grid on
        rotate3d on
        
    end 
end
    
    
%     
%     
%     ACC_X=strcat(dec2hex(out(14,1)),dec2hex(out(15,1)),dec2hex(out(16,1)),dec2hex(out(17,1)));%�ֽ�ƴ��
%     ACC_X=hexsingle2num(ACC_X);%��ʮ������float������ת��Ϊʮ����
%     ACC_Y=strcat(dec2hex(out(18,1)),dec2hex(out(19,1)),dec2hex(out(20,1)),dec2hex(out(21,1)));%�ֽ�ƴ��
%     ACC_Y=hexsingle2num(ACC_Y);%��ʮ������float������ת��Ϊʮ����
%     ACC_Z=strcat(dec2hex(out(22,1)),dec2hex(out(23,1)),dec2hex(out(24,1)),dec2hex(out(25,1)));%�ֽ�ƴ��
%     ACC_Z=hexsingle2num(ACC_Z);%��ʮ������float������ת��Ϊʮ����
%     MAG_X=strcat(dec2hex(out(30,1)),dec2hex(out(31,1)),dec2hex(out(32,1)),dec2hex(out(33,1)));%�ֽ�ƴ��
%     MAG_X=hexsingle2num(MAG_X);%��ʮ������float������ת��Ϊʮ����
%     MAG_Y=strcat(dec2hex(out(34,1)),dec2hex(out(35,1)),dec2hex(out(36,1)),dec2hex(out(37,1)));%�ֽ�ƴ��
%     MAG_Y=hexsingle2num(MAG_Y);%��ʮ������float������ת��Ϊʮ����
%     MAG_Z=strcat(dec2hex(out(38,1)),dec2hex(out(39,1)),dec2hex(out(40,1)),dec2hex(out(41,1)));%�ֽ�ƴ��
%     MAG_Z=hexsingle2num(MAG_Z);%��ʮ������float������ת��Ϊʮ����
%     ACC_g=[ACC_X ACC_Y ACC_Z]
%     MAG_uT=[MAG_X MAG_Y MAG_Z]
%     P=strcat(dec2hex(out(60,1)),dec2hex(out(61,1)),dec2hex(out(62,1)),dec2hex(out(63,1)));%�ֽ�ƴ��
%     Pitch=hexsingle2num(P);%��ʮ������float������ת��Ϊʮ����
%     R=strcat(dec2hex(out(64,1)),dec2hex(out(65,1)),dec2hex(out(66,1)),dec2hex(out(67,1)));
%     Roll=hexsingle2num(R);
%     Y=strcat(dec2hex(out(68,1)),dec2hex(out(69,1)),dec2hex(out(70,1)),dec2hex(out(71,1)));
%     Yaw=hexsingle2num(Y);
%     PRY_angle=[Pitch,Roll,Yaw]
%     PA=HCF1100_Euler(Pitch,Roll,0);%����ŷ���ǹ�ʽ���������
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
%     %3D ��ͼ
%     axes(handles.axes1); 
%     h = get(handles.axes1, 'children'); % ��ȡ�������children����
%     cla(h);%���֮ǰͼ���еĻ�ͼ
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
%     xlabel('X��');
%     ylabel('Y��');
%     zlabel('Z��');
%     
%     
%     
% end
