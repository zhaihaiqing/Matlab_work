%   ���ڵ�BytesAvailableFcn�ص�����
function my_callback(obj,~,handles) 
global scom;
global lenth;
global start;
global len;


%% ���մ��ڷ��͹��������ݣ�������ʱ�����BUG������ԭ���꣩
    out=fread(scom,lenth,'uchar');%��uchar�Ͷ�ȡ52���ֽ�����
    
    amp=zeros(lenth/2,1);
    
    
    
    for i=1:lenth/2
        %amp(i,1)=(strcat(dec2hex(out(i*2-1,1),2),dec2hex(out(i*2,1),2)));%�ֽ�ƴ��
        %amp(i,1)=hex2dec(amp(i,1))
        amp(i,1)=(out(2*i-1,1)*256+out(2*i,1))/1000;
    end
    
    cla
    stop=start+len;
    plot(amp);
    set(gca,'XLim',[0 lenth/2]);
    set(gca,'XTick',0:(lenth/2)/10:lenth/2);
    set(gca,'XTicklabel',[start:len/10:stop]);
    xlabel('X��-���루m��-Ƶ��');ylabel('amplitude');
    hold on
    grid on
  
end
       
        
        
        
        
        
        
        

        
