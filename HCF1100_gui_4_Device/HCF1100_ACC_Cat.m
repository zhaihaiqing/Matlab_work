
%%
function [ax,ay,az]=HCF1100_ACC_Cat(out)

    datanum=14;
    ax=strcat(dec2hex(out(datanum,1),2),dec2hex(out(datanum+1,1),2),dec2hex(out(datanum+2,1),2),dec2hex(out(datanum+3,1),2));%�ֽ�ƴ��
    ax=hexsingle2num(ax);%��ʮ������float������ת��Ϊʮ����
    
    datanum=18;
    ay=strcat(dec2hex(out(datanum,1),2),dec2hex(out(datanum+1,1),2),dec2hex(out(datanum+2,1),2),dec2hex(out(datanum+3,1),2));%�ֽ�ƴ��
    ay=hexsingle2num(ay);%��ʮ������float������ת��Ϊʮ����
    
    datanum=22;
    az=strcat(dec2hex(out(datanum,1),2),dec2hex(out(datanum+1,1),2),dec2hex(out(datanum+2,1),2),dec2hex(out(datanum+3,1),2));%�ֽ�ƴ��
    az=hexsingle2num(az);%��ʮ������float������ת��Ϊʮ���� 
    
end