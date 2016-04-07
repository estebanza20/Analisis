function [ derivadas ] = derivadasEstados( t, z )
%Esta es la funcion que toma un tiempo t y el vector de estados z y calcula
%   la derivada de los estados. Devuelve un vector con estas derivadas.
%   Note que el tiempo no se utiliza, sin embargo en las instrucciones se
%   pide qeu se acepte como entrada de la funcion.
m=9;
k=7;
a=4;
b=6;
derivadas=[0.01*k*z(1)-0.00001*a*z(1)*z(2) ; -0.01*m*z(2)+0.0001*b*z(1)*z(2)];
end

