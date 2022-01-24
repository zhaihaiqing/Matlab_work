subplot(2,2,1);
plot(VarName1,LDJG16,'b')
hold on
plot(VarName1,VarName3,'r')
grid on
Xmin=min(VarName1);
Xmax=max(VarName1);
set(gca,'YLim',[-4 4]);%X轴的数据显示范围
set(gca,'YTick',[-4:1:4]);%设置要显示坐标刻度
xlabel('日期');
ylabel('沉降/mm');
title('LDJG16-112');
legend('真空激光','静力水准');

subplot(2,2,2);
plot(VarName1,LDJG17,'b')
hold on
plot(VarName1,VarName5,'r')
grid on
Xmin=min(VarName1);
Xmax=max(VarName1);
set(gca,'YLim',[-4 4]);%X轴的数据显示范围
set(gca,'YTick',[-4:1:4]);%设置要显示坐标刻度
xlabel('日期');
ylabel('沉降/mm');
title('LDJG17-109');
legend('真空激光','静力水准');

subplot(2,2,3);
plot(VarName1,LDJG18,'b')
hold on
plot(VarName1,VarName7,'r')
grid on
Xmin=min(VarName1);
Xmax=max(VarName1);
set(gca,'YLim',[-4 4]);%X轴的数据显示范围
set(gca,'YTick',[-4:1:4]);%设置要显示坐标刻度
xlabel('日期');
ylabel('沉降/mm');
title('LDJG18-051');
legend('真空激光','静力水准');

subplot(2,2,4);
plot(VarName1,LDJG19,'b')
hold on
plot(VarName1,VarName9,'r')
grid on
Xmin=min(VarName1);
Xmax=max(VarName1);
set(gca,'YLim',[-4 4]);%X轴的数据显示范围
set(gca,'YTick',[-4:1:4]);%设置要显示坐标刻度
xlabel('日期');
ylabel('沉降/mm');
title('LDJG19-114');
legend('真空激光','静力水准');


