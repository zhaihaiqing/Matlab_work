%function [ output_args ] = Untitled1( input_args )
%UNTITLED1 Summary of this function goes here
%  Detailed explanation goes here
G=6.672e-11;ME=5.97e24;vy0=4000; x0=-4.2e7;t0=0;tf=60*60*24*9;
tspan=[t0,tf];Y0=[x0;0;0;vy0];
[t,YY,Te,Ye,Ie]=ode45('DYDt3',[],[],[],G,ME,tspan,Y0); % <3>
X=YY(:,1);Y=YY(:,2);
plot(X,Y,'b','Linewidth',2);hold on
text(0,6e7,'¹ìµÀ','Color','b')
axis('image');
%
plot(Ye(1,1),0.4e7+Ye(1,2),'r^','MarkerSize',10)
plot(Ye(2,1),0.4e7+Ye(2,2),'bv','MarkerSize',10)
plot(Ye(3,1),-0.4e7+Ye(3,2),'b^','MarkerSize',10)
%
text(0.8*Ye(3,1),-2e7+Ye(3,2),['t3=' sprintf('%6.0f',Te(3))])
text(0.8*Ye(2,1),1.5e7+Ye(2,2),['t2=' sprintf('%6.0f',Te(2))])
%
[XE,YE,ZE] = sphere(10);RE=0.64e7;XE=RE*XE;YE=RE*YE;ZE=0*ZE;
mesh(XE,YE,ZE)
text(1e7,1e7,'µØÇò','Color','r'), hold off