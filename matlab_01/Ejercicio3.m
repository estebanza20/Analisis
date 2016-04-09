%este es el ejercicio 3
%Primero se definen las constantes propuestas
h=1/30;
t=0:h:800;
tamano=size(t);
m=9;
k=7;
a=4;
b=6;
%Comentario de uso: 'Se descomenta el caso que se quiere analizar'
%p0=70*(m/b);
%d0=50*(k/a);
%p0=10*(m/b);
%d0=70*(k/a);
%para la extincion se toma 
p0=1;
d0=1000000;
%Se define la matriz inicial de estados, Note que se llena de valores, pero
%esto no afecta pues son sustituidos luego.
z=[1:tamano(2) ; 1:tamano(2)];
z(:, 1)=[p0 d0];
for i=1:tamano(2)-1
    %Se calculan los k del metodo numerico propuesto
    k1=derivadasEstados(t(i), z(:,i));
    k2=derivadasEstados(t(i), z(:,i)+(h/2)*k1);
    k3=derivadasEstados(t(i), z(:,i)+(h/2)*k2);
    k4=derivadasEstados(t(i), z(:,i)+h*k3);
    %se agrega este el nuevo valor a la matriz de estados
    z(:,i+1)=z(:,i)+(h/6)*(k1+2*k2+2*k3+k4);
end
%Se grafica el resultado
plot (t, z(1,:), t, z(2,:))
xlabel('Tiempo');
ylabel('Cantidad de individuos');
title('Solucion del sistema de ecuaciones diferenciales');
legend('presas', 'depredadores')



