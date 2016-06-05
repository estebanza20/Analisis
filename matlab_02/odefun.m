%   xdot=a(by-x)
%   ydot=cx-xz
%   zdot=xy-bz


function dxdt = odefun(t,estados, a, b, c)
x=estados(1);
y=estados(2);
z=estados(3);

dxdt = zeros(3,1);
dxdt(1)=a*(b*y-x);
dxdt(2)=c*x-x.*z;
dxdt(3)=x.*y-b*z;