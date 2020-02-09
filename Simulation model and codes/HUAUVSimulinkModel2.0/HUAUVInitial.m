%==========================================
%模型初始化，一些参数的设定
%             ^ y
%           /
%         /
%         ----------> x
%        |
%        |
%        V  z
%===========================================
clear; clc; close all;

m = 1.8;        %质量
g = 9.8;        %重力加速度
L = 0.19;       %臂长
V = 1e-3;       %体积
Sx = 0.07*0.15;         %x方向面积
Sy = 0.07*0.28;         %y方向面积
Sz = 0.15*0.28;         %z方向面积
Jr = 8.61e-4;       %电机及螺旋桨转动惯量
Jz = 1.318e-2;      %偏航惯量
Jy = 1.318e-2;      %俯仰惯量
Jx = 2.365e-2;      %横滚惯量
buoPos.x = 0;       %浮心坐标
buoPos.y = 0;
buoPos.z = -0.02;


rho.air = 1.29;   %空气密度
rho.water = 1000; %水密度
coeff.air.T = 2.067e-6;        %螺旋桨升力系数
coeff.water.T =  2.067e-3;       %水中螺旋桨推力系数
coeff.air.Q = 2.012e-8;        %螺旋桨扭矩系数
coeff.water.Q = 2.012e-5;       %螺旋桨水中扭矩系
coeff.water.D = 0.9;       %无因次阻力系数，一般在0.8-1.0
coeff.res.p = 0.8;
coeff.res.q = 1;
coeff.res.r = 0.8;

%===位置控制PID参数[x,y,z]===%    
pid.posKp  = [1, 1, 1];
pid.posKi  = [0, 0, 0];
pid.posKd  = [0, 0, 0];
pid.posKpw = [1, 1, 1];
pid.posKiw = [0, 0, 0];
pid.posKdw = [0, 0, 0];
%===角度控制PID参数===%
pid.aglKp  = [1, 1, 1];
pid.aglKi  = [0, 0, 0];
pid.aglKd  = [0, 0, 0];
pid.aglKpw = [1, 1, 1];
pid.aglKiw = [0, 0, 0];
pid.aglKdw = [0, 0, 0];
%======================%

global posState aglState
posState = [0 0 0]';
aglState = [0 0 0]';

save HUAUVPARAMETERS.mat m g L Sx  Sy Sz Jr Jx Jy Jz coeff pid buoPos;