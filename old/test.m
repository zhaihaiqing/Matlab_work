%t=0:0.001:10*pi;
%y=1+sin(t)+sin(2*t)+sin(3*t)+sin(4*t)+sin(5*t)+sin(6*t);
%plot(y);

t=-5:0.001:5;
y=sin(t);
g1=[(t>0)&(t<2)];
plot(g1);
title('sa(t)');
%grid on;
