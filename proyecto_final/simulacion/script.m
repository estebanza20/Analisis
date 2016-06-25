%Este script es el script para hacer las graficas

phi_r_in=[0 0; 5 0; 5.001 1; 10 1; 10.001 0; 15 0; 15.001 -1; 20 -1];
phi_l_in=[0 1; 5 1; 5.001 0; 10 0; 10.001 -1; 15 -1; 15.001 0; 20 0];

Simout= sim('Modelo_cinematico.slx');



figure
plot(x_modelo_directo.Data, y_modelo_directo.Data, x_modelo_desplazado.Data, y_modelo_desplazado.Data,xe_centro_contra_desplazado.Data, ye_centro_contra_desplazado.Data)
legend('Posicion del centro','Posicion punto descentralizado', 'Posicion punto descentralizado ideal')
title('Posicion del robot respecto al tiempo')
xlabel('X')
ylabel('Y')
%xsin ycos
figure
xdotsin=(xdot_modelo_directo.Data).*(sin(orientacion_modelo_directo.Data));
ydotcos=(ydot_modelo_directo.Data).*(cos(orientacion_modelo_directo.Data));
cero=xdotsin-ydotcos;
plot(orientacion_modelo_directo.Time,cero)

%figure
%plot(errors.Data,errors1.Data, errors2.Data, errors3.Data )


figure
plot(ye_dot_in)
figure
plot(derecha_modelo_inverso)
hold
plot(izquierda_modelo_inverso)

figure
plot(omega_centro_contra_desplazamiento)

figure
plot(derecha_limitada)
hold
plot(izquierda_limitada)



%figure
%plot(yedot_modelo_desplazado)
