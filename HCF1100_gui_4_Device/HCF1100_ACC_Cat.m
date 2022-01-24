
%%
function [ax,ay,az]=HCF1100_ACC_Cat(out)

    datanum=14;
    ax=strcat(dec2hex(out(datanum,1),2),dec2hex(out(datanum+1,1),2),dec2hex(out(datanum+2,1),2),dec2hex(out(datanum+3,1),2));%字节拼接
    ax=hexsingle2num(ax);%将十六进制float型数据转换为十进制
    
    datanum=18;
    ay=strcat(dec2hex(out(datanum,1),2),dec2hex(out(datanum+1,1),2),dec2hex(out(datanum+2,1),2),dec2hex(out(datanum+3,1),2));%字节拼接
    ay=hexsingle2num(ay);%将十六进制float型数据转换为十进制
    
    datanum=22;
    az=strcat(dec2hex(out(datanum,1),2),dec2hex(out(datanum+1,1),2),dec2hex(out(datanum+2,1),2),dec2hex(out(datanum+3,1),2));%字节拼接
    az=hexsingle2num(az);%将十六进制float型数据转换为十进制 
    
end