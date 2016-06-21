%este script se encarga de las simulaciones del robot diferencial
%utilizando el modelo cinematico.
b=2;

%se define el vector de tiempo
t=0:0.01:10;
samples=size(t)
%se defifnen las funciones que describen el comportamiento de los motores.
vr=sin(t);
vl=t;

%se calcula la velocidad angular
omega=vr/b-vl/b;

%se calcula el angulo, la orientacion del robot

theta=zeros(1, samples(2));
for i=2:samples(2)
    theta(i)=trapz(t(1:i), omega(1:i));
end
figure
plot (t, theta)
%se calculan las velocidades traslacionales
vx=cos(theta).*(vr+vl)*0.5;
vy=sin(theta).*(vr+vl)*0.5;

%se calcula la posicion

x=zeros(1, samples(2));
y=zeros(1, samples(2));
for i=2:samples(2)
    x(i)=trapz(t(1:i), vx(1:i));
    y(i)=trapz(t(1:i), vy(1:i));
end
figure
plot (x,y)

