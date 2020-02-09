clear; clc; close all;

Ts = 0.01;    %采样时间
fs = 1/Ts;
t = 0:Ts:10;
fc = 10;    %截止频率
opt = 1;
if opt == 1
    target = ones(size(t));
else
    target = sin(t);
end
uo = zeros(size(t));
steps = size(t); 
alpha = 2*pi*fc*Ts/(1+2*pi*fc*Ts); %滤波系数
v1 = 0.2*randn(size(t));%白噪声
v2 = 0.5*(0.5*sin(1e6*t)+1*sin(1e5*t)+0.7*sin(1e4*t)+0.5*sin(1e3*t)+0.3*sin(1e2*t))/5; %高频有色噪声
v3 = 0.5*(0.5*sin(10*t)+sin(t)+0.7*sin(0.1*t)+sin(0.01*t)+0.9*sin(0.001*t))/5; %低频有色噪声
ui =target +  v3;
uo(1) = ui(1);
for k=2:steps(2)
    uo(k) = alpha*ui(k)+(1-alpha)*uo(k-1);
end
figure(1)
plot(t,ui,'r-.',t,uo,'b',t,target,'k--');
title('一阶低通滤波/fc=10Hz')
legend('原始数据','滤波后数据','目标值')
xlabel('时间');
ylabel('幅度')
grid on

figure(2)
plot(t,ui-target,'r:.',t,uo-target,'b-');
title('误差分析');
xlabel('时间(s)');
ylabel('误差');
legend('原始误差','滤波后误差')
grid on


