%   ���ڵ�BytesAvailableFcn�ص�����
function my_callback(obj,~,handles) 
global scom;
global lenth;
global len;


%% ���մ��ڷ��͹��������ݣ�������ʱ�����BUG������ԭ���꣩
    out=fread(scom,lenth,'uchar');%��uchar�Ͷ�ȡ52���ֽ�����
    
    amp=zeros(len,1);
    
    ts=(out(1,1)*256+out(2,1))/1000;
    
    for i=1:len
        %amp(i,1)=(strcat(dec2hex(out(i*2-1,1),2),dec2hex(out(i*2,1),2)));%�ֽ�ƴ��
        %amp(i,1)=hex2dec(amp(i,1))
        amp(i,1)=(out(2*(i+1)-1,1)*256+out(2*(i+1),1))-30000;
    end
    
    Fs=len/ts;   %������
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
    
    f = Fs*(0:(N/2))/N;%����������Ӧ��Ƶ��ֵ
    axes(handles.axes5)
    pol=5;
    plot(f,P1)
    grid on; 
    title('Single-Sided Amplitude Spectrum of X(t)')
    xlabel('f (Hz)')
    ylabel('|P1(f)|')
    
    
    PY=Y;
    tol = 0.4;  
    PY(P1 < tol) = 0; %ȥ�����������ţ�ֻ���Ƴ��źŵ���λ
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
%     xlabel('X��-���루m��-Ƶ��');ylabel('amplitude');
%     hold on
%     grid on
  
end
       
        
        
        
        
        
        
        

        
