%   ���ڵ�BytesAvailableFcn�ص�����
function my_callback(obj,~,handles) 
    global scom;
    global DP_Info;
    
    global Rx_Flag;

    out=fread(scom,8,'uchar')%��uchar�Ͷ�ȡ60���ֽ�����
    if out(2,1)==9
        %Rx_Flag=1;
        S=['->Software Reset OK!',' '];
        DP_Info=[S,DP_Info]; 
        set(handles.edit15,'string',DP_Info);   %��edit3��չʾԪ������
    end
    
    if out(2,1)==162
        Rx_Flag=1;
        S=['->Step 0:get Bootloader info OK!',' '];
        DP_Info=[S,DP_Info]; 
        set(handles.edit15,'string',DP_Info);   %��edit3��չʾԪ������
    end
    
    if out(2,1)==163
        Rx_Flag=2;
        S=['->Step 0:Re Update commend...',' '];
        DP_Info=[S,DP_Info]; 
        set(handles.edit15,'string',DP_Info);   %��edit3��չʾԪ������
    end
    
    if out(2,1)==165
        Rx_Flag=3;
        S=['->Step 1:Connect Device OK!',' '];
        DP_Info=[S,DP_Info]; 
        set(handles.edit15,'string',DP_Info);   %��edit3��չʾԪ������
    end
    
    if out(2,1)==166
        Rx_Flag=4;
        S=['->Step 2:Send Image File Info OK!',' '];
        DP_Info=[S,DP_Info]; 
        set(handles.edit15,'string',DP_Info);   %��edit3��չʾԪ������
    end
    
    if out(2,1)==167
        Rx_Flag=5;
        S=['->Step 3:Send Image dataFrame OK',' '];
        DP_Info=[S,DP_Info]; 
        set(handles.edit15,'string',DP_Info);   %��edit3��չʾԪ������
    end
    
     if out(2,1)==183
        Rx_Flag=6;
        S=['->Step 3:Completed Update Firmware!'];
        DP_Info=[S,DP_Info]; 
        set(handles.edit15,'string',DP_Info);   %��edit3��չʾԪ������
     end
    
     add=3;   
     tem=strcat(dec2hex(out(add,1)),dec2hex(out(add+1,1)),dec2hex(out(add+2,1)),dec2hex(out(add+3,1)));%�ֽ�ƴ��
    
        
            
    
    
    
%% ���մ��ڷ��͹��������ݣ�������ʱ�����BUG������ԭ���꣩
%     %out=fscanf(scom,'%e',7)%���ַ��ͻ�ȡ����
%     RX_Count=1+RX_Count;
%     out=fread(scom,65,'uchar');%��uchar�Ͷ�ȡ60���ֽ�����
%     
%     add=16;
%     tem=strcat(dec2hex(out(add,1)),dec2hex(out(add+1,1)),dec2hex(out(add+2,1)),dec2hex(out(add+3,1)));%�ֽ�ƴ��
%     AHd=hexsingle2num(tem);%��ʮ������float������ת��Ϊʮ����
%     
%     add=20;
%     tem=strcat(dec2hex(out(add,1)),dec2hex(out(add+1,1)),dec2hex(out(add+2,1)),dec2hex(out(add+3,1)));%�ֽ�ƴ��
%     Temp=hexsingle2num(tem);%��ʮ������float������ת��Ϊʮ����
%     
%     add=24;
%     tem=strcat(dec2hex(out(add,1)),dec2hex(out(add+1,1)),dec2hex(out(add+2,1)),dec2hex(out(add+3,1)));%�ֽ�ƴ��
%     AHa=hexsingle2num(tem);%��ʮ������float������ת��Ϊʮ����
%     
%     add=28;
%     tem=strcat(dec2hex(out(add,1)),dec2hex(out(add+1,1)),dec2hex(out(add+2,1)),dec2hex(out(add+3,1)));%�ֽ�ƴ��
%     ADC_mV=hexsingle2num(tem);%��ʮ������float������ת��Ϊʮ����
%     
%     add=32;
%     tem=strcat(dec2hex(out(add,1)),dec2hex(out(add+1,1)),dec2hex(out(add+2,1)),dec2hex(out(add+3,1)));%�ֽ�ƴ��
%     Pa=hexsingle2num(tem);%��ʮ������float������ת��Ϊʮ����
%     
%     add=52;
%     tem=strcat(dec2hex(out(add,1)),dec2hex(out(add+1,1)),dec2hex(out(add+2,1)),dec2hex(out(add+3,1)));%�ֽ�ƴ��
%     BHd=hexsingle2num(tem);%��ʮ������float������ת��Ϊʮ����
%     
%     add=56;
%     tem=strcat(dec2hex(out(add,1)),dec2hex(out(add+1,1)),dec2hex(out(add+2,1)),dec2hex(out(add+3,1)));%�ֽ�ƴ��
%     BHa=hexsingle2num(tem);%��ʮ������float������ת��Ϊʮ����
%     
%     add=60;
%     tem=strcat(dec2hex(out(add,1)),dec2hex(out(add+1,1)),dec2hex(out(add+2,1)),dec2hex(out(add+3,1)));%�ֽ�ƴ��
%     Main_V=hexsingle2num(tem);%��ʮ������float������ת��Ϊʮ����
%     
%     
%     STemp=[':Temp=',num2str(Temp),'�� '];
%     SAHd=['AHd=',num2str(AHd),'mm '];
%     SAHa=['AHa=',num2str(AHa),'mm '];
%     SADC_mV=['ADC_mV=',num2str(ADC_mV),'mV '];
%     SPa=['Pa=',num2str(Pa),'Pa '];
%     SBHd=['BHd=',num2str(BHd),'mm '];
%     SBHa=['BHa=',num2str(BHa),'mm '];
%     SMain_V=['Main_V=',num2str(Main_V),'V '];
%     
%     S=[num2str(RX_Count),STemp,SADC_mV,SPa,SBHd,SBHa,SAHd,SAHa,SMain_V];
%     DP_C=[S,DP_C];                      %�����ݷ�װ��һ��Ԫ������
% 	%DP_N=flip(DP_C);                    %���鷴�򣬱������µ�������ǰ
%     %set(handles.edit3,'string',S);
%     set(handles.edit3,'string',DP_C);   %��edit3��չʾԪ������
% 	%set(handles.edit3,'string',DP_N);
% 
%     set(handles.edit4,'string',[num2str(Temp),'��']);
%     set(handles.edit5,'string',[num2str(Main_V),'V']);
%     set(handles.edit6,'string',[num2str(ADC_mV),'mV']);
%     set(handles.edit7,'string',[num2str(Pa),'Pa']);
%     set(handles.edit8,'string',[num2str(BHd),'mm']);
%     set(handles.edit9,'string',[num2str(BHa),'mm']);
%     set(handles.edit10,'string',[num2str(AHd),'mm']);
%     set(handles.edit11,'string',[num2str(AHa),'mm']);
    
end



