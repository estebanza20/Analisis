%Este script es el script para hacer las graficas




figure
plot(x_centro_contra_desplazado.Data, y_centro_contra_desplazado.Data, xe_centro_contra_desplazado.Data, ye_centro_contra_desplazado.Data)
legend('Posicion del centro','Posicion punto desplazado')

%figure
%plot(errors.Data,errors1.Data, errors2.Data, errors3.Data )
figure
plot(ye_dot_in)
figure
plot(derecha_modelo_inverso)
hold
plot(izquierda_modelo_inverso)
legend('derecho', 'izquierdo')


figure
plot(yedot_modelo_desplazado)
%figure
%plot(errors)
%figure
%plot(errors1)
%figure
%plot(errors2)
%figure
%plot(errors3)