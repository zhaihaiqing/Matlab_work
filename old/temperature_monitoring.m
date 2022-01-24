%% 端口设置
COM='com8';  %端口设置，根据具体情况修改

if exist('s','var') %如果变量s存在
        if ~isa(s,'serial') %如果变量s不是串行端口，则定义一个串口变量s，并打开
        s=serial(COM);
        fopen(s);
        else                %如果变量s是串行端口且s没有处于open状态，那么打开s
            if ~strcmp(s.Status,'open')
                fopen(s);
            end
        end
else                 %如果不存在s变量，那么定义变量串口变量s,并打开
         s=serial(COM);
        fopen(s);  
end
%% 绘图窗口设置
hfig=figure;  %新建一个绘图窗口
hline=plot(0,0,'r');  %随意绘制一条曲线，返回曲线的句柄hline
title('实时温度监控'); %设置标题
                   %xlabel(['时间(min)【从' regexprep(num2str(clock),' {1,}','-') '12-25-0:55开始】']);
xlabel('时间(min)');  %设置x轴标注
ylabel('温度（℃）'); %设置y轴标注
try   %尝试 加载存储的历史温度数据文件，文件中的变量T是一个 x*1 矩阵
load temperature.mat
catch %如果加载失败，定义一个空变量T
    T=[];
    xlabel(['时间(min)【从' regexprep(num2str(clock),' {1,}','-') '12-25-0:55开始】']);
end
%% 串口通信部分。获取温度数据并实时更新绘图。
while ishandle(hfig)    %通过窗口句柄hfig判断监控窗口是否被关闭。关闭则结束循环
    if s.BytesAvailable~=0   %判断串口中的可用数据
        temp=fread(s,s.BytesAvailable);  %读取串口数据 
        %下位机发送的数据格式微 'TEMPHLTEMPHLTEMP...' ,TEMP是我设置的温度标记符号
        %只起到一个定位的作用，H代表温度数据的高8位，L代表温度数据的低8位，以下程序
        %通过查找TEMP标记定位获取H和L。并转换计算出实际的温度。
        %[H L]共同组成温度数据[S S S S S H3 H2 H1 L8 L7 L6 L5 L4 L3 L2 L1]
        %高8位H分别为[S S S S S H3 H2 H1] 前5位S是温度标记,当温度为正时，S为0；
        %当温度为负时，S为1，[H L]是补码形式。
        % 位 温度(℃)
        % H3   2^6
        % H2   2^5
        % H1   2^4
        % L8   2^3
        % L7   2^2
        % L6   2^1
        % L5   2^0
        % L4   2^-1
        % L3   2^-2
        % L2   2^-3
        % L1   2^-4
        temp_str=char(temp)';    %转换成字符串，转换成行向量
        MATCH_START=regexp(temp_str,'TEMP'); %正则查找 'TEMP'字符串，返回第一个标记的位置
                
                if ~isempty(MATCH_START)   %判断从串口读来的数据中的第一个温度标记TEMP。
                    if (MATCH_START>2)     %如果第一个TEMP标记前有至少两个字节，说明第一个
                                           %TEMP标记前存在一个有效温度数据。
                         high_temp=temp(MATCH_START-2);
                         low_temp=temp(MATCH_START-1);
                    else                   %否则定义两个空变量，分别存储温度数据的高8位和低8位
                        high_temp=[];
                        low_temp=[];
                    end
                     temp(1:MATCH_START(1)-1)=[];  %将温度标记前的数据略去
                     temp( end-rem(numel(temp),6)+1:end )=[];  %将最后一个温度标记后的无用数据略去
                     high_temp=[high_temp; temp(5:6:end)];%取温度的高位[s s s s s  h3  h2  h1]
                     low_temp=[low_temp; temp(6:6:end)];  %取温度的低位[l1 l2 l3 l4 l5 l6 l7 l8]
                     temp=high_temp*256+low_temp;
                     for i=1:numel(temp)
                         if temp(i)>2^15  %温度为负值是，取补码
                             disp(['负的温度高8位' num2str(high_temp(i)) '低8位' num2str(low_temp(i))]);
                             temp(i)= -(1+bitcmp(temp(i),16))*0.0625;  %所有位取反加1，取低11位    
                             disp(['计算温度为' num2str(temp(i))]);
                         else
                             temp(i)=temp(i)*0.0625;
                         end
                     end
                     T=[T; temp]; %将温度添加到温度数据变量中
                    set(hline,'xdata',(1:numel(T))/54.79,'ydata',T);%更新绘图
                end
    end
    pause(5);
end
save('temperature.mat','T');
fclose(s);
delete(s);
clear s