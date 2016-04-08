% Script para resolver por metodos numericos la siguiente ecuacion

x = -5000:0.01:5000;
y=x.^3+x.^2+6*x+55*cos(x)-10*x.*exp(0.2*x)-(x.^2).*exp(-0.3*x);
tamano=size(y);
soluciones=[];

%Se itera sobre uan seccion del dominio para encontrar un valor donde la 
%funcion cambie de signo

for i=2:tamano(2)
    if y(i)*y(i-1)<0
        %en medio de estos dos hay un cambio de signo, portanto hay una
        %solucion, entonces se encuentra y se agrega al vector de
        %soluciones
        soluciones=[soluciones solucionParticular(x(i-1), x(i), y(i-1), y(i))];
    end
end
%Se imprimen las soluciones
soluciones
%se grafica la funcion
subplot(2,1,1), plot (x,y);
title('Grafica de la funcion')
%Se grafica una porcion mas pequena para ver las soluciones
cantSoluciones=size(soluciones);
x=soluciones(1)-1:0.01:soluciones(cantSoluciones(2))+1;
y=x.^3+x.^2+6*x+55*cos(x)-10*x.*exp(0.2*x)-(x.^2).*exp(-0.3*x);
cero=0*x;
subplot(2,1,2), plot (x,y, x, cero)
title('Soluciones')

