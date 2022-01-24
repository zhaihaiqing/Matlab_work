%% �˿�����
COM='com8';  %�˿����ã����ݾ�������޸�

if exist('s','var') %�������s����
        if ~isa(s,'serial') %�������s���Ǵ��ж˿ڣ�����һ�����ڱ���s������
        s=serial(COM);
        fopen(s);
        else                %�������s�Ǵ��ж˿���sû�д���open״̬����ô��s
            if ~strcmp(s.Status,'open')
                fopen(s);
            end
        end
else                 %���������s��������ô����������ڱ���s,����
         s=serial(COM);
        fopen(s);  
end
%% ��ͼ��������
hfig=figure;  %�½�һ����ͼ����
hline=plot(0,0,'r');  %�������һ�����ߣ��������ߵľ��hline
title('ʵʱ�¶ȼ��'); %���ñ���
                   %xlabel(['ʱ��(min)����' regexprep(num2str(clock),' {1,}','-') '12-25-0:55��ʼ��']);
xlabel('ʱ��(min)');  %����x���ע
ylabel('�¶ȣ��棩'); %����y���ע
try   %���� ���ش洢����ʷ�¶������ļ����ļ��еı���T��һ�� x*1 ����
load temperature.mat
catch %�������ʧ�ܣ�����һ���ձ���T
    T=[];
    xlabel(['ʱ��(min)����' regexprep(num2str(clock),' {1,}','-') '12-25-0:55��ʼ��']);
end
%% ����ͨ�Ų��֡���ȡ�¶����ݲ�ʵʱ���»�ͼ��
while ishandle(hfig)    %ͨ�����ھ��hfig�жϼ�ش����Ƿ񱻹رա��ر������ѭ��
    if s.BytesAvailable~=0   %�жϴ����еĿ�������
        temp=fread(s,s.BytesAvailable);  %��ȡ�������� 
        %��λ�����͵����ݸ�ʽ΢ 'TEMPHLTEMPHLTEMP...' ,TEMP�������õ��¶ȱ�Ƿ���
        %ֻ��һ����λ�����ã�H�����¶����ݵĸ�8λ��L�����¶����ݵĵ�8λ�����³���
        %ͨ������TEMP��Ƕ�λ��ȡH��L����ת�������ʵ�ʵ��¶ȡ�
        %[H L]��ͬ����¶�����[S S S S S H3 H2 H1 L8 L7 L6 L5 L4 L3 L2 L1]
        %��8λH�ֱ�Ϊ[S S S S S H3 H2 H1] ǰ5λS���¶ȱ��,���¶�Ϊ��ʱ��SΪ0��
        %���¶�Ϊ��ʱ��SΪ1��[H L]�ǲ�����ʽ��
        % λ �¶�(��)
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
        temp_str=char(temp)';    %ת�����ַ�����ת����������
        MATCH_START=regexp(temp_str,'TEMP'); %������� 'TEMP'�ַ��������ص�һ����ǵ�λ��
                
                if ~isempty(MATCH_START)   %�жϴӴ��ڶ����������еĵ�һ���¶ȱ��TEMP��
                    if (MATCH_START>2)     %�����һ��TEMP���ǰ�����������ֽڣ�˵����һ��
                                           %TEMP���ǰ����һ����Ч�¶����ݡ�
                         high_temp=temp(MATCH_START-2);
                         low_temp=temp(MATCH_START-1);
                    else                   %�����������ձ������ֱ�洢�¶����ݵĸ�8λ�͵�8λ
                        high_temp=[];
                        low_temp=[];
                    end
                     temp(1:MATCH_START(1)-1)=[];  %���¶ȱ��ǰ��������ȥ
                     temp( end-rem(numel(temp),6)+1:end )=[];  %�����һ���¶ȱ�Ǻ������������ȥ
                     high_temp=[high_temp; temp(5:6:end)];%ȡ�¶ȵĸ�λ[s s s s s  h3  h2  h1]
                     low_temp=[low_temp; temp(6:6:end)];  %ȡ�¶ȵĵ�λ[l1 l2 l3 l4 l5 l6 l7 l8]
                     temp=high_temp*256+low_temp;
                     for i=1:numel(temp)
                         if temp(i)>2^15  %�¶�Ϊ��ֵ�ǣ�ȡ����
                             disp(['�����¶ȸ�8λ' num2str(high_temp(i)) '��8λ' num2str(low_temp(i))]);
                             temp(i)= -(1+bitcmp(temp(i),16))*0.0625;  %����λȡ����1��ȡ��11λ    
                             disp(['�����¶�Ϊ' num2str(temp(i))]);
                         else
                             temp(i)=temp(i)*0.0625;
                         end
                     end
                     T=[T; temp]; %���¶���ӵ��¶����ݱ�����
                    set(hline,'xdata',(1:numel(T))/54.79,'ydata',T);%���»�ͼ
                end
    end
    pause(5);
end
save('temperature.mat','T');
fclose(s);
delete(s);
clear s