%   ���ڵ�BytesAvailableFcn�ص�����
function my_callback(obj,~,handles) 
    global scom;
    global RX_Count;
    global Pitch;
%% ���մ��ڷ��͹��������ݣ�������ʱ�����BUG������ԭ���꣩
    %out=fscanf(scom,'%e',7)%���ַ��ͻ�ȡ����
    RX_Count=1+RX_Count;
    out=fread(scom,12,'uchar');%��uchar�Ͷ�ȡ12���ֽ�����
    P=strcat(dec2hex(out(1,1)),dec2hex(out(2,1)),dec2hex(out(3,1)),dec2hex(out(4,1)));%�ֽ�ƴ��
    Pitch=hexsingle2num(P);%��ʮ������float������ת��Ϊʮ����
    R=strcat(dec2hex(out(5,1)),dec2hex(out(6,1)),dec2hex(out(7,1)),dec2hex(out(8,1)));
    Roll=hexsingle2num(R);
    Y=strcat(dec2hex(out(9,1)),dec2hex(out(10,1)),dec2hex(out(11,1)),dec2hex(out(12,1)));
    Yaw=hexsingle2num(Y);
    PRY=[Pitch,Roll,Yaw]
    PA=HCF1100_Euler(Pitch,Roll,Yaw)%����ŷ���ǹ�ʽ���������
   
    x2=0;y2=0;z2=0;
    
    X=[x2,PA(1,1)];
    Y=[y2,PA(2,1)];
    Z=[z2,PA(3,1)];
    
%     axes(handles.axes1);  
%     plot(RX_Count,Pitch,'--r*');
%     plot(RX_Count,Roll,'--b*');
%     hold on
%     grid on
    
    %3D ��ͼ
    axes(handles.axes1); 
    h = get(handles.axes1, 'children'); % ��ȡ�������children����
    cla(h);%���֮ǰͼ���еĻ�ͼ
    grid on;
    hold on;
    plot3(X,Y,Z,'-b*','LineWidth',2);
    
    X=[PA(1,1),PA(1,1)];
    Y=[PA(2,1),PA(2,1)];
    Z=[0,PA(3,1)];
    plot3(X,Y,Z,'r--.','LineWidth',0.5);
    X=[0,PA(1,1)];
    Y=[PA(2,1),PA(2,1)];
    Z=[0,0];
    plot3(X,Y,Z,'g--.','LineWidth',0.5);
    X=[PA(1,1),PA(1,1)];
    Y=[0,PA(2,1)];
    Z=[0,0];
    plot3(X,Y,Z,'m--.','LineWidth',0.5);
    
    
    set(gca,'Xlim',[-50,50]);
    set(gca,'Ylim',[-50,50]);
    set(gca,'Zlim',[0,50]);
    xlabel('X��');
    ylabel('Y��');
    zlabel('Z��');
    
    
    
end
