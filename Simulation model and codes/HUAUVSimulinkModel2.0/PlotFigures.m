close all;clc

opt = 1;

if opt == 0
    figure(1)
    plot(tout,agl(:,1)); hold on;
    plot(tout,pi/6*ones(size(tout)))
    grid on;
    title('Roll Step Response');
    xlabel('t(s)');
    ylabel('\theta(rad)')
    legend('response curve','target curve')

    figure(2)
    plot(tout,agl(:,2)); hold on;
    plot(tout,pi/6*ones(size(tout)))
    grid on;
    title('pitch Step Response');
    xlabel('t(s)');
    ylabel('\phi')
    legend('response curve','target curve')

    figure(3)
    plot(tout,agl(:,3)); hold on;
    plot(tout,pi/6*ones(size(tout)))
    grid on;
    title('yew Step Response');
    xlabel('t(s)');
    ylabel('\psi')
    legend('response curve','target curve')
else
    T = size(tout);
    t = 0:0.01:T(1);
    figure(1)
    subplot(131)
    plot(tout,pos(:,1),'r'); hold on; 
    plot(tout,sin(0.5*tout),'b');
    grid on;
    title('x response curve');
    xlabel('t(s)');
    ylabel('x(m)');
    legend('response curve','target curve')
    
    subplot(132)
    plot(tout,pos(:,2),'r'); hold on; 
    plot(tout,sin(0.5*tout),'b');
    grid on;
    title('y response curve');
    xlabel('t(s)');
    ylabel('y(m)');
    legend('response curve','target curve')
    
    subplot(133)
    plot(tout,pos(:,3),'r'); hold on; 
    plot(tout,sin(0.25*tout),'b');
    grid on;
    title('z response curve');
    xlabel('t(s)');
    ylabel('z(m)');
    legend('response curve','target curve')
    
    figure(2)
    
    plot(tout,agl);grid on;
    title('angle response');
    xlabel('t(s)');
    ylabel('angle(rad)');
    legend('\phi response','\theta response','\psi response')
    
    figure(3)
%     X = -1.5:0.1:1.5;
%     Y = -1.5:0.1:1.5;
%     C = 0;
%     a = 0;
%     b = 0;
%     [X1,Y1] = meshgrid(X,Y);
%     Z=a.*X1+b.*Y1+C;
%     surf(X,Y,Z);hold on;
%     shading interp
%     alpha(0.5)
    
    x = sin(0.5*t);
    y = sin(0.5*t);
    z = sin(0.25*t);
    
    plot3(pos(:,1),pos(:,2),pos(:,3),'r-','LineWidth',1);hold on;
    plot3(x,y,z,'b-.','LineWidth',2);grid on;
    title('Path Contrast');
    xlabel('x(m)');ylabel('y(m)');zlabel('z(m)');
    xlim ([-1.5 1.5]);
    ylim ([-1.5 1.5]);
    zlim ([-1.5 1.5]);
   
   legend('practical path','ideal path')
 
%     legend('water surface','practical path','ideal path')
    
    
    
end


