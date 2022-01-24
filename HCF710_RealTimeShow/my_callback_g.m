%   串口的BytesAvailableFcn回调函数
function my_callback(obj,~,handles) 
global scom;
global RX_Count;
%global data2;
global device_addr;

global hx;
global window_width;
global show_x_max;
global show_x_min;


%% 接收串口发送过来的数据（这里有时会出现BUG，具体原因不详）
    out=fread(scom,75,'uchar');%以uchar型读取52个字节数据
    
    if out(1,1)==device_addr
        data2=HCF710_data_Cat(out);
        RX_Count=RX_Count+1;
        
        set(handles.edit1,'string',data2(1,2));   %在edit3中展示元胞数组
        set(handles.edit2,'string',data2(1,3));   %在edit3中展示元胞数组
        set(handles.edit47,'string',data2(1,4));   %在edit3中展示元胞数组
        set(handles.edit49,'string',data2(1,5));   %在edit3中展示元胞数组
        set(handles.edit53,'string',data2(1,1));   %在edit3中展示元胞数组
        set(handles.edit55,'string',data2(1,6));   %在edit3中展示元胞数组
        
        show_data=data2(1,2);
        
        if show_data>show_x_max
            show_x_max=show_data;
        end
        if show_data<show_x_min
            show_x_min=show_data;
        end
        
       %%绘制动态曲线
        N=window_width;      %图形显示200个数据，超过的滑动显示
        addpoints(hx,RX_Count,show_data);%循环向动态线中添加点
        drawnow
        hold on;
        if RX_Count<N
            axis([0 N+N/50 show_x_min-0.5 show_x_max+0.5]);
        else
            axis([RX_Count-N RX_Count+N/50 show_x_min-0.5 show_x_max+0.5]);
        end
        
        
        grid on
       %hold on
       
    end
end
       
        
        
        
        
        
        
        

        
