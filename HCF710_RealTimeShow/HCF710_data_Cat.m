
%%
function HCF710_data=HCF710_data_Cat(out)

    datanum=42;
    t=strcat(dec2hex(out(datanum,1),2),dec2hex(out(datanum+1,1),2),dec2hex(out(datanum+2,1),2),dec2hex(out(datanum+3,1),2));%字节拼接
    temp=hexsingle2num(t);%将十六进制float型数据转换为十进制 
    
    datanum=54;
    ba=strcat(dec2hex(out(datanum,1),2),dec2hex(out(datanum+1,1),2),dec2hex(out(datanum+2,1),2),dec2hex(out(datanum+3,1),2));%字节拼接
    bha=hexsingle2num(ba);%将十六进制float型数据转换为十进制
    
    datanum=58;
    ad=strcat(dec2hex(out(datanum,1),2),dec2hex(out(datanum+1,1),2),dec2hex(out(datanum+2,1),2),dec2hex(out(datanum+3,1),2));%字节拼接
    bhd=hexsingle2num(ad);%将十六进制float型数据转换为十进制
    
    datanum=62;
    aa=strcat(dec2hex(out(datanum,1),2),dec2hex(out(datanum+1,1),2),dec2hex(out(datanum+2,1),2),dec2hex(out(datanum+3,1),2));%字节拼接
    aha=hexsingle2num(aa);%将十六进制float型数据转换为十进制 
    
    datanum=66;
    ad=strcat(dec2hex(out(datanum,1),2),dec2hex(out(datanum+1,1),2),dec2hex(out(datanum+2,1),2),dec2hex(out(datanum+3,1),2));%字节拼接
    ahd=hexsingle2num(ad);%将十六进制float型数据转换为十进制
    
    datanum=70;
    v=strcat(dec2hex(out(datanum,1),2),dec2hex(out(datanum+1,1),2),dec2hex(out(datanum+2,1),2),dec2hex(out(datanum+3,1),2));%字节拼接
    vol=hexsingle2num(v);%将十六进制float型数据转换为十进制 
    
    HCF710_data(1,1)=temp;
    HCF710_data(1,2)=bha;
    HCF710_data(1,3)=bhd;
    HCF710_data(1,4)=aha;
    HCF710_data(1,5)=ahd;
    HCF710_data(1,6)=vol;
    
end
