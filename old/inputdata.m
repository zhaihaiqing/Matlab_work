%%%%插值与拟合
%matlab的一维插值函数为interp1（a,c,b）和interp1(a,c,b,method),
%一维插值有线性插值（linear）、三次多项式（cubic）和spline,如果数据的变化较大，
%以spline插值所形成的曲线最为平滑，效果最好

%MATLAB中二维插值函数是interp2(x,y,z,xi,yi)，期中xi,yi为要插值的数据点，x，y，z为已知数据
%通过设定interp2(x,y,z,xi,yi,method)也可以设定不同的插值方法，有linear、cubic和spline三种
%

x=0:1:10;
y=[0.01,1.22,2.41,3.06,4.39,5.13,6.77,7.24,8.32,9.15,10.64];
xx=0:0.25:10;
yy=spline(x,y,xx);
plot(x,y,'r',xx,yy,'-b');
legend('原始数据','拟合后数据',2)      %图例标注
hold on




%曲线拟合(curve-fitting)顾名思义就是用近似的曲线方程来代表一组离散的数据
%曲线拟合与插值有许多相似之处，二者最大区别再于曲线拟合要找出一个曲线函数式，而插值仅求出与数据点对应的函数值而已
%曲线拟合运用最小二乘法原理
%如果拟合的曲线限定为多项式就称为多项式最小二乘法曲线拟合
%MATLAB提供的曲线拟合有多项式最小二乘拟合、普通最小二乘拟合等

%（1）Custom Equations 自定义拟合的线性或非线性方程；
%（2）Exponential指数拟合包括两种形式：
%    y=a*exp(b*x)
%    y=a*exp(b*x)+c*exp(d*x)
%（3）Fourier傅立叶拟合，正弦和余弦之和（共8个多项式）

%（4）Gaussian 高斯法

%（5）Interpolant 内插法，包括线性内插、最近邻内插、三次样条内插和shape-preserving内插；
%（6）Polynomial多项式，从一次到九次；
%（7）Rational有理拟合，两个多项式之比，分子与分母都是多项式；
%（8）Power指数拟合，包括两种形式：
%        y=a*x^b
%        y=a*x^b+c
%（9）Smoothing spline 平滑样条拟合，默认的平滑参数由拟合的数据集来决定，参数是0产生一个分段的线性多项式拟合，参数是1产生一个分段三次多项式拟合；
%（10）Sum of Sin Functions 正弦函数的和，采用以下8个公式：
%             a1*sin(b1*x+c1)
%                   …
%             a1*sin(b1*x+c1)+…+ a8*sin(b8*x+c8)
%（11）Weibull 两个参数的Weibull分布，表达式如下：
%      Y=a*b*x^(b-1)*exp(-a*x^b)

%其中对于一般离散的分析时，采用Polynomial多项式和Fourier傅立叶拟合方法较好。




   
