%   ���ڵ�BytesAvailableFcn�ص�����
function my_callback(obj,~,handles) 
global scom;
global RX_Count;
%global data2;
global device_addr;

global hx;
global window_width;
global show_x_max;
global show_x_min;


%% ���մ��ڷ��͹��������ݣ�������ʱ�����BUG������ԭ���꣩
    out=fread(scom,75,'uchar');%��uchar�Ͷ�ȡ52���ֽ�����
    
    if out(1,1)==device_addr
        data2=HCF710_data_Cat(out);
        RX_Count=RX_Count+1;
        
        set(handles.edit1,'string',data2(1,2));   %��edit3��չʾԪ������
        set(handles.edit2,'string',data2(1,3));   %��edit3��չʾԪ������
        set(handles.edit47,'string',data2(1,4));   %��edit3��չʾԪ������
        set(handles.edit49,'string',data2(1,5));   %��edit3��չʾԪ������
        set(handles.edit53,'string',data2(1,1));   %��edit3��չʾԪ������
        set(handles.edit55,'string',data2(1,6));   %��edit3��չʾԪ������
        
        show_data=data2(1,2);
        
        if show_data>show_x_max
            show_x_max=show_data;
        end
        if show_data<show_x_min
            show_x_min=show_data;
        end
        
       %%���ƶ�̬����
        N=window_width;      %ͼ����ʾ200�����ݣ������Ļ�����ʾ
        addpoints(hx,RX_Count,show_data);%ѭ����̬������ӵ�
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
       
        
        
        
        
        
        
        

        
