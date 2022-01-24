%   串口的BytesAvailableFcn回调函数
function my_callback(obj,~,handles) 
    global scom;
    global RX_Count;
    global ADC_Value;

%% 接收串口发送过来的数据（这里有时会出现BUG，具体原因不详）
    %out=fscanf(scom,'%e',7)%以字符型获取数据
    RX_Count=1+RX_Count;
    out=fread(scom,75,'uchar');%以uchar型读取60个字节数据
    
    %float数据拼包
    reg_addr=31;
    add=reg_addr*2+4;
    tem=strcat(dec2hex(out(add,1)),dec2hex(out(add+1,1)),dec2hex(out(add+2,1)),dec2hex(out(add+3,1)));%字节拼接
    AHd=hexsingle2num(tem);%将十六进制float型数据转换为十进制
    
    reg_addr=19;
    add=reg_addr*2+4;
    tem=strcat(dec2hex(out(add,1)),dec2hex(out(add+1,1)),dec2hex(out(add+2,1)),dec2hex(out(add+3,1)));%字节拼接
    Temp=hexsingle2num(tem);%将十六进制float型数据转换为十进制
    
    reg_addr=29;
    add=reg_addr*2+4;
    tem=strcat(dec2hex(out(add,1)),dec2hex(out(add+1,1)),dec2hex(out(add+2,1)),dec2hex(out(add+3,1)));%字节拼接
    AHa=hexsingle2num(tem);%将十六进制float型数据转换为十进制
    
    reg_addr=21;
    add=reg_addr*2+4;
    tem=strcat(dec2hex(out(add,1)),dec2hex(out(add+1,1)),dec2hex(out(add+2,1)),dec2hex(out(add+3,1)));%字节拼接
    ADC_mV=hexsingle2num(tem);%将十六进制float型数据转换为十进制
    
    reg_addr=23;
    add=reg_addr*2+4;
    tem=strcat(dec2hex(out(add,1)),dec2hex(out(add+1,1)),dec2hex(out(add+2,1)),dec2hex(out(add+3,1)));%字节拼接
    Pa=hexsingle2num(tem);%将十六进制float型数据转换为十进制
    
    reg_addr=27;
    add=reg_addr*2+4;
    tem=strcat(dec2hex(out(add,1)),dec2hex(out(add+1,1)),dec2hex(out(add+2,1)),dec2hex(out(add+3,1)));%字节拼接
    BHd=hexsingle2num(tem);%将十六进制float型数据转换为十进制
    
    reg_addr=25;
    add=reg_addr*2+4;
    tem=strcat(dec2hex(out(add,1)),dec2hex(out(add+1,1)),dec2hex(out(add+2,1)),dec2hex(out(add+3,1)));%字节拼接
    BHa=hexsingle2num(tem);%将十六进制float型数据转换为十进制
    
    reg_addr=33;
    add=reg_addr*2+4;
    tem=strcat(dec2hex(out(add,1)),dec2hex(out(add+1,1)),dec2hex(out(add+2,1)),dec2hex(out(add+3,1)));%字节拼接
    Main_V=hexsingle2num(tem);%将十六进制float型数据转换为十进制
    
    set(handles.edit4,'string',[num2str(Temp),'℃']);
    set(handles.edit5,'string',[num2str(Main_V),'V']);
    set(handles.edit6,'string',[num2str(ADC_mV),'mV']);
    set(handles.edit7,'string',[num2str(Pa),'Pa']);
    set(handles.edit8,'string',[num2str(BHd),'mm']);
    set(handles.edit9,'string',[num2str(BHa),'mm']);
    set(handles.edit10,'string',[num2str(AHd),'mm']);
    set(handles.edit11,'string',[num2str(AHa),'mm']);
    
     ADC_Value = [ADC_Value ADC_mV(:,1)];
     t=1:RX_Count;
     cla;
     min_ADC_Value=1.2*min(ADC_Value);
     max_ADC_Value=1.2*max(ADC_Value);
     plot(t,ADC_Value,'-r');
     %axis([1 RX_Count min_ADC_Value max_ADC_Value])
     %axis(axes_handle,[1 RX_Count min_ADC_Value max_ADC_Value]);
     %ylim([min_ADC_Value,max_ADC_Value]);
     grid on
     hold on
    
    
    
end



