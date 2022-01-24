%   串口的BytesAvailableFcn回调函数
function my_callback(obj,~,handles) 
global scom;
global RX_Count;

global data2;
global data3;
global d3_acj;

global Sdata;

global device1;
global device2;

%% 接收串口发送过来的数据（这里有时会出现BUG，具体原因不详）
    out=fread(scom,75,'uchar');%以uchar型读取52个字节数据
    
    if out(1,1)==device1
        data2=HCF710_data_Cat(out);
        RX_Count=1;
    end
    if out(1,1)==device2
        data3=HCF710_data_Cat(out);       
        RX_Count=2;
    end
        
    if RX_Count==2;
        RX_Count=0;
       
        
        D2_cj_B=data2(1,3)-data2(1,3);
        D3_cj_B=data3(1,3)-data2(1,3);
        
        D2_cj_A=data2(1,5)-data2(1,5);
        D3_cj_A=data3(1,5)-data2(1,5);
       
        set(handles.edit1,'string',data2(1,2));   %在edit3中展示元胞数组
        set(handles.edit2,'string',data2(1,3));   %在edit3中展示元胞数组
        set(handles.edit3,'string',D2_cj_B);   %在edit3中展示元胞数组
        set(handles.edit47,'string',data2(1,4));   %在edit3中展示元胞数组
        set(handles.edit49,'string',data2(1,5));   %在edit3中展示元胞数组
        set(handles.edit51,'string',D2_cj_A);   %在edit3中展示元胞数组
        set(handles.edit53,'string',data2(1,1));   %在edit3中展示元胞数组
        set(handles.edit55,'string',data2(1,6));   %在edit3中展示元胞数组
        
        set(handles.edit6,'string',data3(1,2));   %在edit3中展示元胞数组
        set(handles.edit7,'string',data3(1,3));   %在edit3中展示元胞数组
        set(handles.edit8,'string',D3_cj_B);   %在edit3中展示元胞数组
        set(handles.edit48,'string',data3(1,4));   %在edit3中展示元胞数组
        set(handles.edit50,'string',data3(1,5));   %在edit3中展示元胞数组
        set(handles.edit52,'string',D3_cj_A);   %在edit3中展示元胞数组
        set(handles.edit54,'string',data3(1,1));   %在edit3中展示元胞数组
        set(handles.edit56,'string',data3(1,6));   %在edit3中展示元胞数组
        
       
        
        date=datetime();
        
       
        Sd2bha=[num2str(data2(1,2)),' '];
        Sd2bhd=[num2str(data2(1,3)),' '];
        Sd2bcj=[num2str(D2_cj_B),' '];
        Sd2aha=[num2str(data2(1,4)),' '];
        Sd2ahd=[num2str(data2(1,5)),' '];
        Sd2acj=[num2str(D2_cj_A),' '];
        Sd2temp=[num2str(data2(1,1)),' '];
        Sd2vol=[num2str(data2(1,6)),' '];
        
        Sd3bha=[num2str(data3(1,2)),' '];
        Sd3bhd=[num2str(data3(1,3)),' '];
        Sd3bcj=[num2str(D3_cj_B),' '];
        Sd3aha=[num2str(data3(1,4)),' '];
        Sd3ahd=[num2str(data3(1,5)),' '];
        Sd3acj=[num2str(D3_cj_A),' '];
        Sd3temp=[num2str(data3(1,1)),' '];
        Sd3vol=[num2str(data3(1,6)),' '];
        Sdate=[datestr(date),'\r\n'];
        
      
        Sdata=[Sd2bha,Sd2bhd,Sd2bcj,Sd2aha,Sd2ahd,Sd2acj,Sd2temp,Sd2vol,Sd3bha,Sd3bhd,Sd3bcj,Sd3aha,Sd3ahd,Sd3acj,Sd3temp,Sd3vol,Sdate]; 
        
        d3_acj = [d3_acj D3_cj_A];
        lend=length(d3_acj);
        tt=1:lend;
        cla;
        %min_ADC_Value=1.2*min(ADC_Value);
        %max_ADC_Value=1.2*max(ADC_Value);
        plot(tt,d3_acj,'-r');
        hold on
        plot(tt,d3_acj,'*r');
        title('D3ACJ');
        grid on
        hold on
        
         %cla reset
%         cla
%         plot3(X,Y,Z,'-b*','LineWidth',2);
%         axis([-2000 2000 -2000 2000 0 2000]);
%         xlabel('X轴-主方向-mm');ylabel('Y轴-次方向-mm');zlabel('Z轴-竖向-mm');
%         hold on
%         grid on
%         rotate3d on
  
    end
end
       
        
        
        
        
        
        
        

        
