%   串口的BytesAvailableFcn回调函数
function my_callback(obj,~,handles) 
global scom;
global hx;
global rx_count;


%% 接收串口发送过来的数据（这里有时会出现BUG，具体原因不详）
    out=fread(scom,2,'uchar');%以uchar型读取52个字节数据
    
    rx_count=rx_count+1;
    amp=(out(1,1)*256+out(2,1))-30000;
    
    N=1000;
    addpoints(hx,rx_count,amp);%循环向动态线中添加点
    ylabel('Y轴-um');
    drawnow
    hold on;
    grid on
     if rx_count<N
           %axis([0 N+N/50 show_x_min-0.5 show_x_max+0.5]);
           xlim([0 N+50]);
     else
           %axis([RX_Count-N RX_Count+N/50 show_x_min-0.5 show_x_max+0.5]);
           xlim([rx_count-N rx_count+50]);
     end
    
 
    
    
    

    


    
    
    
    
    
    
    
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
       
        
        
        
        
        
        
        

        
