%   串口的BytesAvailableFcn回调函数
function my_callback(obj,~,handles) 
    global scom;
    global RX_Count;
    global DP_C;

    
    
%% 接收串口发送过来的数据（这里有时会出现BUG，具体原因不详）
    %out=fscanf(scom,'%e',7)%以字符型获取数据
    RX_Count=1+RX_Count;
    out=fread(scom,65,'uchar');%以uchar型读取60个字节数据
    
    add=16;
    tem=strcat(dec2hex(out(add,1)),dec2hex(out(add+1,1)),dec2hex(out(add+2,1)),dec2hex(out(add+3,1)));%字节拼接
    AHd=hexsingle2num(tem);%将十六进制float型数据转换为十进制
    
    add=20;
    tem=strcat(dec2hex(out(add,1)),dec2hex(out(add+1,1)),dec2hex(out(add+2,1)),dec2hex(out(add+3,1)));%字节拼接
    Temp=hexsingle2num(tem);%将十六进制float型数据转换为十进制
    
    add=24;
    tem=strcat(dec2hex(out(add,1)),dec2hex(out(add+1,1)),dec2hex(out(add+2,1)),dec2hex(out(add+3,1)));%字节拼接
    AHa=hexsingle2num(tem);%将十六进制float型数据转换为十进制
    
    add=28;
    tem=strcat(dec2hex(out(add,1)),dec2hex(out(add+1,1)),dec2hex(out(add+2,1)),dec2hex(out(add+3,1)));%字节拼接
    ADC_mV=hexsingle2num(tem);%将十六进制float型数据转换为十进制
    
    add=32;
    tem=strcat(dec2hex(out(add,1)),dec2hex(out(add+1,1)),dec2hex(out(add+2,1)),dec2hex(out(add+3,1)));%字节拼接
    Pa=hexsingle2num(tem);%将十六进制float型数据转换为十进制
    
    add=52;
    tem=strcat(dec2hex(out(add,1)),dec2hex(out(add+1,1)),dec2hex(out(add+2,1)),dec2hex(out(add+3,1)));%字节拼接
    BHd=hexsingle2num(tem);%将十六进制float型数据转换为十进制
    
    add=56;
    tem=strcat(dec2hex(out(add,1)),dec2hex(out(add+1,1)),dec2hex(out(add+2,1)),dec2hex(out(add+3,1)));%字节拼接
    BHa=hexsingle2num(tem);%将十六进制float型数据转换为十进制
    
    add=60;
    tem=strcat(dec2hex(out(add,1)),dec2hex(out(add+1,1)),dec2hex(out(add+2,1)),dec2hex(out(add+3,1)));%字节拼接
    Main_V=hexsingle2num(tem);%将十六进制float型数据转换为十进制
    
    
    STemp=[':Temp=',num2str(Temp),'℃ '];
    SAHd=['AHd=',num2str(AHd),'mm '];
    SAHa=['AHa=',num2str(AHa),'mm '];
    SADC_mV=['ADC_mV=',num2str(ADC_mV),'mV '];
    SPa=['Pa=',num2str(Pa),'Pa '];
    SBHd=['BHd=',num2str(BHd),'mm '];
    SBHa=['BHa=',num2str(BHa),'mm '];
    SMain_V=['Main_V=',num2str(Main_V),'V '];
    
    S=[num2str(RX_Count),STemp,SADC_mV,SPa,SBHd,SBHa,SAHd,SAHa,SMain_V];
    DP_C=[S,DP_C];                      %将数据封装成一个元胞数组
	%DP_N=flip(DP_C);                    %数组反序，保持最新的数据在前
    %set(handles.edit3,'string',S);
    set(handles.edit3,'string',DP_C);   %在edit3中展示元胞数组
	%set(handles.edit3,'string',DP_N);

    set(handles.edit4,'string',[num2str(Temp),'℃']);
    set(handles.edit5,'string',[num2str(Main_V),'V']);
    set(handles.edit6,'string',[num2str(ADC_mV),'mV']);
    set(handles.edit7,'string',[num2str(Pa),'Pa']);
    set(handles.edit8,'string',[num2str(BHd),'mm']);
    set(handles.edit9,'string',[num2str(BHa),'mm']);
    set(handles.edit10,'string',[num2str(AHd),'mm']);
    set(handles.edit11,'string',[num2str(AHa),'mm']);
    
end



