%%%���������ڷ���HCF800�������ݣ�
%%%����excel���ݣ�Ȼ��ͼ������
i=0;
N=3;%excel�����sheet����

for k=1:N
    
    i=i+1;
    figure;
    %����excel���� i ��sheet
    [data] = xlsread('C:\Users\haiqing\Desktop\HCF800��������\����.xlsx',i);
    lx=length(data);%�������ݳ���
    at=data(1:lx,1);%��ȡ��һ������
    
    %�ڴ˴��Ը߶�ֵ��ӻ����˲�����ɾ������
    
    temp=data(1:lx,2);%��ȡ�ڶ�������
    x=(1:1:lx);
    maxat=max(at);
    minat=min(at);
    maxtemp=max(temp);
    mintemp=min(temp);
 
    [ax,h1,h2] = plotyy(x,at,x,temp);%����˫Y������
    %set(ax(1),'ylim',[min_axis,max_axis]);
    set(ax(1),'yTick',[minat:2:maxat]);
    set(ax(2),'yTick',[mintemp:2:maxtemp]);
    grid on
    xlabel('��������');                                 %x��˵��
    set(get(ax(1),'Ylabel'),'String','�߶�ֵ��mm��');   %y1��˵��
    set(get(ax(2),'Ylabel'),'String','�¶�ֵ���棩');   %y2��˵��
    title(['�߶�ֵ���¶ȱ仯����',num2str(i)]);         %���title
    
end
