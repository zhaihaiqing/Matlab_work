%   串口的BytesAvailableFcn回调函数
function my_callback(obj,~,handles) 
global scom;
global lenth;
global len;


%% 接收串口发送过来的数据（这里有时会出现BUG，具体原因不详）
    out=fread(scom,lenth,'uchar');%以uchar型读取52个字节数据
    
    amp=zeros(len,1);
    
    ts=(out(1,1)*256+out(2,1))/1000;
    
    for i=1:len
        %amp(i,1)=(strcat(dec2hex(out(i*2-1,1),2),dec2hex(out(i*2,1),2)));%字节拼接
        %amp(i,1)=hex2dec(amp(i,1))
        amp(i,1)=(out(2*(i+1)-1,1)*256+out(2*(i+1),1))-30000;
    end
    
    Fs=len/ts;   %采样率
    T=1/Fs;
    N=len;
    t=(0:N-1)*T;
    
    X=amp;
    
    axes(handles.axes1)
    plot(1000*t,X)
    grid on; 
    title('Original Signal')
    xlabel('t (milseconds)')
    ylabel('X(t)-um')
    
    Y = fft(X);
    P2 = abs(Y);
    P1=P2(1:N/2+1);
    P1(1,1)=P1(1,1)/N;
    P1(2:N/2+1)=P1(2:N/2+1)*2/N;
    
    f = Fs*(0:(N/2))/N;%计算各个点对应的频率值
    axes(handles.axes5)
    pol=5;
    plot(f,P1)
    grid on; 
    title('Single-Sided Amplitude Spectrum of X(t)')
    xlabel('f (Hz)')
    ylabel('|P1(f)|')
    
    
    PY=Y;
    tol = 0.4;  
    PY(P1 < tol) = 0; %去除掉噪声干扰，只绘制出信号的相位
    phase=angle(PY)*180/pi;
    axes(handles.axes6)
    plot(f,phase(1:N/2+1));
    grid on; 
    title('Single-Sided Phase Spectrum of X(t)')
    xlabel('f (Hz)')
    ylabel('Phase')
    
    
    
    
    
    
    
    
%     cla
%     stop=start+len;
%     plot(amp);
%     set(gca,'XLim',[0 lenth/2]);
%     set(gca,'XTick',0:(lenth/2)/10:lenth/2);
%     set(gca,'XTicklabel',[start:len/10:stop]);
%     xlabel('X轴-距离（m）-频谱');ylabel('amplitude');
%     hold on
%     grid on
  
end
       
        
        
        
        
        
        
        

        
