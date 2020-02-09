clear; clc;close all;

Ts=0.005; %采样时间
t = 0:Ts:2;
steps = size(t);

w = 0.05*randn(steps(2),2); %预测噪声
v = 0.5*randn(size(t)); %观测噪声
Q = cov(w); %系统噪声协方差
R = cov(v); %观测噪声协方差
Kv = zeros(steps);
Kx = zeros(steps);

opt = 0;
if opt == 0
    target = sin(10*t);
else
    target = ones(size(t));
end

mz = target + v;
z = mz;

x = [0; 0];%初始状态
P = [0,0;0,0]; %状态的初始协方差矩阵

F = [1, Ts; 0, 1]; %状态转换矩阵
H = [1, 0];  %观测矩阵


for k=2:1:steps(2) 
   %Time update
    x_=F*x;               %状态预测方程
    P_=F*P*F'+ Q;            %协方差预测方程
    
    %Measurement update
    K = P*H'/(H*P*H'+R);         %卡尔曼增益的计算
    x = F*x_+K*(z(k)-H*F*x_);     %最优值的计算
    P = (eye(2)-K*H)*P_;          %协方差更新方程
    
    Kx(k) = K(1);
    Kv(k) = K(2);
    z(k) = H*x;           %Filtered value   滤波以后的值
end
figure(1);
plot(t,mz,'r:.',t,z,'b',t,target,'k--');
title('信号频率为0.1Hz');
xlabel('时间(s)');
ylabel('角度(rad)')
legend('测量值','滤波后的值','目标值');
grid on

figure(2)
plot(t,Kx,'r.-',t,Kv,'b');
title('卡尔曼增益K');
xlabel('时间(s)');
ylabel('K')
legend('角度卡尔曼增益','角速度卡尔曼增益');
grid on

figure(3)
plot(t,mz-target,'r:.',t,z-target,'b');
title('误差分析');
xlabel('时间(s)');
ylabel('误差');
legend('原始误差','滤波后误差');
grid on


