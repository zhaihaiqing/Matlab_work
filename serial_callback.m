function serial_callback(s,BytesAvailable,p)
 
global t;
global x;
global m;
global ii;

out=fscanf(s);
data=str2num(out);

t=[t ii];
m=[m data];
set(p,'Xdata',t,'Ydata',m(1,;));

drawnow
x=x+1;
axis(x-100 x+100 -90 90);
ii=ii+1;
end