clc;
global t;
global x;
global m;
global ii;

t=[0];
m=[0];
ii=0;
x=0;
p=plot(t,m,'EraseMode','background','MarkerSize',5);
axis([x-100 x+100 -90 90]);
grid on;

s=instrfind('Type','serial','Port','COM4','Tag','');

if isempty(s)
    s=serial('COM4');
else
    fclose(s);
    s=s(1);
end
set(s,'BaudRate',9600,'DataBits',8,'StopBits',1,'Parity','none','FlowControl','none');
s.BytesAvailableFcnMode = 'terminator';
s.BytesAvailableFcn = {@serial_callback,p};
fopen(s);

pause;
fclose(s);
delete(instrfindall);
clear s;
close all;
clear all;











