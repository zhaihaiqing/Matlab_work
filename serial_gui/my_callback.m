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

 
%% ���մ��ڷ��͹��������ݣ�������ʱ�����BUG������ԭ���꣩
    %out=fscanf(scom,'%e',7)%���ַ��ͻ�ȡ����
    out=fread(scom,109,'uchar');%��uchar�Ͷ�ȡ52���ֽ�����
    
    if out(1,1)==1
        datanum=84;
        PX1=strcat(dec2hex(out(datanum,1)),dec2hex(out(datanum+1,1)),dec2hex(out(datanum+2,1)),dec2hex(out(datanum+3,1)));%�ֽ�ƴ��
        PX1=hexsingle2num(PX1);%��ʮ������float������ת��Ϊʮ����
        datanum=88;
        PY1=strcat(dec2hex(out(datanum,1)),dec2hex(out(datanum+1,1)),dec2hex(out(datanum+2,1)),dec2hex(out(datanum+3,1)));%�ֽ�ƴ��
        PY1=hexsingle2num(PY1);%��ʮ������float������ת��Ϊʮ����
        datanum=92;
        PZ1=strcat(dec2hex(out(datanum,1)),dec2hex(out(datanum+1,1)),dec2hex(out(datanum+2,1)),dec2hex(out(datanum+3,1)));%�ֽ�ƴ��
        PZ1=hexsingle2num(PZ1);%��ʮ������float������ת��Ϊʮ���� 
        RX_Count=1;
    end
    
    if out(1,1)==2
        datanum=84;
        PX2=strcat(dec2hex(out(datanum,1)),dec2hex(out(datanum+1,1)),dec2hex(out(datanum+2,1)),dec2hex(out(datanum+3,1)));%�ֽ�ƴ��
        PX2=hexsingle2num(PX2);%��ʮ������float������ת��Ϊʮ����
        datanum=88;
        PY2=strcat(dec2hex(out(datanum,1)),dec2hex(out(datanum+1,1)),dec2hex(out(datanum+2,1)),dec2hex(out(datanum+3,1)));%�ֽ�ƴ��
        PY2=hexsingle2num(PY2);%��ʮ������float������ת��Ϊʮ����
        datanum=92;
        PZ2=strcat(dec2hex(out(datanum,1)),dec2hex(out(datanum+1,1)),dec2hex(out(datanum+2,1)),dec2hex(out(datanum+3,1)));%�ֽ�ƴ��
        PZ2=hexsingle2num(PZ2);%��ʮ������float������ת��Ϊʮ����  
        RX_Count=2;
    end
    
    if out(1,1)==3
        datanum=84;
        PX3=strcat(dec2hex(out(datanum,1)),dec2hex(out(datanum+1,1)),dec2hex(out(datanum+2,1)),dec2hex(out(datanum+3,1)));%�ֽ�ƴ��
        PX3=hexsingle2num(PX3);%��ʮ������float������ת��Ϊʮ����
        datanum=88;
        PY3=strcat(dec2hex(out(datanum,1)),dec2hex(out(datanum+1,1)),dec2hex(out(datanum+2,1)),dec2hex(out(datanum+3,1)));%�ֽ�ƴ��
        PY3=hexsingle2num(PY3);%��ʮ������float������ת��Ϊʮ����
        datanum=92;
        PZ3=strcat(dec2hex(out(datanum,1)),dec2hex(out(datanum+1,1)),dec2hex(out(datanum+2,1)),dec2hex(out(datanum+3,1)));%�ֽ�ƴ��
        PZ3=hexsingle2num(PZ3);%��ʮ������float������ת��Ϊʮ���� 
        RX_Count=3;
    end
    
    if out(1,1)==4
        datanum=84;
        PX4=strcat(dec2hex(out(datanum,1)),dec2hex(out(datanum+1,1)),dec2hex(out(datanum+2,1)),dec2hex(out(datanum+3,1)));%�ֽ�ƴ��
        PX4=hexsingle2num(PX4);%��ʮ������float������ת��Ϊʮ����
        datanum=88;
        PY4=strcat(dec2hex(out(datanum,1)),dec2hex(out(datanum+1,1)),dec2hex(out(datanum+2,1)),dec2hex(out(datanum+3,1)));%�ֽ�ƴ��
        PY4=hexsingle2num(PY4);%��ʮ������float������ת��Ϊʮ����
        datanum=92;
        PZ4=strcat(dec2hex(out(datanum,1)),dec2hex(out(datanum+1,1)),dec2hex(out(datanum+2,1)),dec2hex(out(datanum+3,1)));%�ֽ�ƴ��
        PZ4=hexsingle2num(PZ4);%��ʮ������float������ת��Ϊʮ���� 
        RX_Count=4;
    end
    
    
    if RX_Count==4  %�������ݽ������
        
        RX_Count=0;
       
        x0=0;
        x1=PX1;
        x2=PX1+PX2;
        x3=PX1+PX2+PX3;
        x4=PX1+PX2+PX3+PX4;
        
        y0=0;
        y1=PY1;
        y2=PY1+PY2;
        y3=PY1+PY2+PY3;
        y4=PY1+PY2+PY3+PY4;
        
        z0=0;
        z1=PZ1;
        z2=PZ1+PZ2;
        z3=PZ1+PZ2+PZ3;
        z4=PZ1+PZ2+PZ3+PZ4;
        
        clc;
        X=[x0,x1,x2,x3,x4]
        Y=[y0,y1,y2,y3,y4]
        Z=[z0,z1,z2,z3,z4]
        
        cla reset
        plot3(X,Y,Z,'-b*','LineWidth',2);
        axis([-200 200 -200 200 -200 200]);
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
