
% x1=0.041173;
% y1=-0.009393;
% z1=0.971748;
% t1=-176.1715973;
A=table2array(ADXL355);
P1=HCF1100_Position_Calculation(A(1,1),A(1,2),A(1,3),A(1,4));
P2=HCF1100_Position_Calculation(A(2,1),A(2,2),A(2,3),A(2,4));
P3=HCF1100_Position_Calculation(A(3,1),A(3,2),A(3,3),A(3,4));
P4=HCF1100_Position_Calculation(A(4,1),A(4,2),A(4,3),A(4,4));
P5=HCF1100_Position_Calculation(A(5,1),A(5,2),A(5,3),A(5,4));
P6=HCF1100_Position_Calculation(A(6,1),A(6,2),A(6,3),A(6,4));
P7=HCF1100_Position_Calculation(A(7,1),A(7,2),A(7,3),A(7,4));
P8=HCF1100_Position_Calculation(A(8,1),A(8,2),A(8,3),A(8,4));

PX1=P1(1,1);PY1=P1(2,1);PZ1=P1(3,1);
PX2=P2(1,1);PY2=P2(2,1);PZ2=P2(3,1);
PX3=P3(1,1);PY3=P3(2,1);PZ3=P3(3,1);
PX4=P4(1,1);PY4=P4(2,1);PZ4=P4(3,1);
PX5=P5(1,1);PY5=P5(2,1);PZ5=P5(3,1);
PX6=P6(1,1);PY6=P6(2,1);PZ6=P6(3,1);
PX7=P7(1,1);PY7=P7(2,1);PZ7=P7(3,1);
PX8=P8(1,1);PY8=P8(2,1);PZ8=P8(3,1);

x0=0;
x1=x0+PX1;
x2=x1+PX2;
x3=x2+PX3;
x4=x3+PX4;
x5=x4+PX5;
x6=x5+PX6;
x7=x6+PX7;
x8=x7+PX8;

        
y0=0;
y1=y0+PY1;
y2=y1+PY2;
y3=y2+PY3;
y4=y3+PY4;
y5=y4+PY5;
y6=y5+PY6;
y7=y6+PY7;
y8=y7+PY8;
        
z0=0;
z1=z0+PZ1;
z2=z1+PZ2;
z3=z2+PZ3;
z4=z3+PZ4;
z5=z4+PZ5;
z6=z5+PZ6;
z7=z6+PZ7;
z8=z7+PZ8;
        

X=[x0,x1,x2,x3,x4,x5,x6,x7,x8];
Y=[y0,y1,y2,y3,y4,y5,y6,y7,y8];
Z=[z0,z1,z2,z3,z4,z5,z6,z7,z8];

X=X*10
Y=Y*10
Z=Z*10

cla
plot3(X,Y,Z,'-b*','LineWidth',2);
axis([-100 100 -100 100 0 4000]);
xlabel('X轴-主方向-mm');ylabel('Y轴-次方向-mm');zlabel('Z轴-竖向-mm');
hold on
grid on
rotate3d on

