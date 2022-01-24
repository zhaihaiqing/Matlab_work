t=[1]
m=sin(t)
p = plot(t,m,'-r','EraseMode','background','MarkerSize',5);
%p = plot(t,m,'background','MarkerSize',5);
x=-1.5*pi;
axis([x x+2*pi -1.5 1.5]);
grid on;

N=500;

for i=1:1000000000000000000
    t=[t 0.1*i];  
    m=[m sin(0.1*i)]; 
    set(p,'XData',t,'YData',m)   
    drawnow
    if i<N
        axis([0 N*0.1+N/100 -1.5 1.5]);
       % pause(0.001);
    else
        axis([0.1*i-N*0.1 0.1*i+N/100 -1.5 1.5]);
       % pause(0.1);
    end
    
    
end