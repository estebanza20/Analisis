%Laboratorio 2 Matlab
%resolver:
%   xdot=a(by-x)
%   ydot=cx-xz
%   z=xy-bz

%Para la primera simulacion:
tspan=[0 200];
a=10;
b=4.85;
c=10;
x01=[2.3 -1.3 10];
[t,x] = ode45(@(t,x) odefun(t,x,a,b,c), tspan, x01);
%el valor final
x(end,:)
%size([x(:,3) x(:,3)])
%surface(x(:,1), x(:,2), x(:,3), t);
%surface([x(:,1), x(:,1)], [x(:,2), x(:,2)], [x(:,3), x(:,3)], 1000*[t, t]);

%plot3(x(:,1), x(:,2), x(:,3))
%plot(t, x(:,1));
view(3)

