
%%
function HCF710_data=HCF710_data_Cat(out)

    datanum=42;
    t=strcat(dec2hex(out(datanum,1),2),dec2hex(out(datanum+1,1),2),dec2hex(out(datanum+2,1),2),dec2hex(out(datanum+3,1),2));%�ֽ�ƴ��
    temp=hexsingle2num(t);%��ʮ������float������ת��Ϊʮ���� 
    
    datanum=54;
    ba=strcat(dec2hex(out(datanum,1),2),dec2hex(out(datanum+1,1),2),dec2hex(out(datanum+2,1),2),dec2hex(out(datanum+3,1),2));%�ֽ�ƴ��
    bha=hexsingle2num(ba);%��ʮ������float������ת��Ϊʮ����
    
    datanum=58;
    ad=strcat(dec2hex(out(datanum,1),2),dec2hex(out(datanum+1,1),2),dec2hex(out(datanum+2,1),2),dec2hex(out(datanum+3,1),2));%�ֽ�ƴ��
    bhd=hexsingle2num(ad);%��ʮ������float������ת��Ϊʮ����
    
    datanum=62;
    aa=strcat(dec2hex(out(datanum,1),2),dec2hex(out(datanum+1,1),2),dec2hex(out(datanum+2,1),2),dec2hex(out(datanum+3,1),2));%�ֽ�ƴ��
    aha=hexsingle2num(aa);%��ʮ������float������ת��Ϊʮ���� 
    
    datanum=66;
    ad=strcat(dec2hex(out(datanum,1),2),dec2hex(out(datanum+1,1),2),dec2hex(out(datanum+2,1),2),dec2hex(out(datanum+3,1),2));%�ֽ�ƴ��
    ahd=hexsingle2num(ad);%��ʮ������float������ת��Ϊʮ����
    
    datanum=70;
    v=strcat(dec2hex(out(datanum,1),2),dec2hex(out(datanum+1,1),2),dec2hex(out(datanum+2,1),2),dec2hex(out(datanum+3,1),2));%�ֽ�ƴ��
    vol=hexsingle2num(v);%��ʮ������float������ת��Ϊʮ���� 
    
    HCF710_data(1,1)=temp;
    HCF710_data(1,2)=bha;
    HCF710_data(1,3)=bhd;
    HCF710_data(1,4)=aha;
    HCF710_data(1,5)=ahd;
    HCF710_data(1,6)=vol;
    
end
