function [ solucion ] = solucionParticular( xl, xu, yl, yu )
%Encuentra la solucion de la ecuacion entre el xl y xu
%   Se utiliza un metodo recursivo.
if abs(yl*yu)<0.0000001
    %el resultado esta sumamente cerca de 0, por tanto es solucion
    solucion=(xl*yu-xu*yl)/(yu-yl);
else
    xr=(xl*yu-xu*yl)/(yu-yl);
    yr=xr^3+xr^2+6*xr+55*cos(xr)-10*xr.*exp(0.2*xr)-(xr^2)*exp(-0.3*xr);
    if yl*yr<0
        %la solucion esta entre xl y xr
        solucion=solucionParticular(xl, xr, yl, yr);
    else
        %la solucion esta entre xr y xu
        solucion=solucionParticular(xr, xu, yr, yu);
    end
end
end

