%   串口的BytesAvailableFcn回调函数
function my_callback(obj,~,handles) 
global scom;
global lenth;
global start;
global len;


%% 接收串口发送过来的数据（这里有时会出现BUG，具体原因不详）
    out=fread(scom,lenth,'uchar');%以uchar型读取52个字节数据
    
    amp=zeros(lenth/2,1);
    
    
    
    for i=1:lenth/2
        %amp(i,1)=(strcat(dec2hex(out(i*2-1,1),2),dec2hex(out(i*2,1),2)));%字节拼接
        %amp(i,1)=hex2dec(amp(i,1))
        amp(i,1)=(out(2*i-1,1)*256+out(2*i,1))/1000;
    end
    
    cla
    stop=start+len;
    plot(amp);
    set(gca,'XLim',[0 lenth/2]);
    set(gca,'XTick',0:(lenth/2)/10:lenth/2);
    set(gca,'XTicklabel',[start:len/10:stop]);
    xlabel('X轴-距离（m）-频谱');ylabel('amplitude');
    hold on
    grid on
  
end
       
        
        
        
        
        
        
        

        
