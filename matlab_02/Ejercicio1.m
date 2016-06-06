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
x0=[2.3 -1.3 10];
[t,x] = ode45(@(t,x) odefun(t,x,a,b,c), tspan, x0);
%el valor final
x(end,:)
surface([x(:,1), x(:,1)], [x(:,2), x(:,2)], [x(:,3), x(:,3)], [t, t], 'EdgeColor', 'flat');
colorbar;
x_sim_1=x;
view([-18 28])
print( 'pictures/primera_simulacion', '-depsc');
view([90 0]) %yz view
print( 'pictures/primera_simulacion_yz', '-depsc');
view([0 90]) %xy view
print( 'pictures/primera_simulacion_xy', '-depsc');
view([0 0]) %xz view
print( 'pictures/primera_simulacion_xz', '-depsc');

%Para la segunda simulacion
b=8.5;
x0=[-2.3 1.3 -10];
[t,x] = ode45(@(t,x) odefun(t,x,a,b,c), tspan, x0);
x(end,:)
surface([x(:,1), x(:,1)], [x(:,2), x(:,2)], [x(:,3), x(:,3)], [t, t], 'EdgeColor', 'flat');
colorbar;
x_sim_1=x;
view([-18 28])
print( 'pictures/segunda_simulacion', '-depsc');
view([90 0]) %yz view
print( 'pictures/segunda_simulacion_yz', '-depsc');
view([0 90]) %xy view
print( 'pictures/segunda_simulacion_xy', '-depsc');
view([0 0]) %xz view
print( 'pictures/segunda_simulacion_xz', '-depsc');

%Para la tercera simulacion
b=8.6;
x0=[0.1 -1 -1];
[t,x] = ode45(@(t,x) odefun(t,x,a,b,c), tspan, x0);
x(end,:)
surface([x(:,1), x(:,1)], [x(:,2), x(:,2)], [x(:,3), x(:,3)], [t, t], 'EdgeColor', 'flat');
colorbar;
x_sim_1=x;
view([-18 28])
%saveas(gcf, 'pictures/primera_simulacion', 'eps');
print( 'pictures/tercera_simulacion', '-depsc');
view([90 0]) %yz view
print( 'pictures/tercera_simulacion_yz', '-depsc');
view([0 90]) %xy view
print( 'pictures/tercera_simulacion_xy', '-depsc');
view([0 0]) %xz view
print( 'pictures/tercera_simulacion_xz', '-depsc');




