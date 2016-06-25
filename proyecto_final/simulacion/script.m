%Este script es el script para hacer las graficas
%la variable save es para determinar si se desan guardar las graficas
%automaticamente. save = 0 no guarda. save = 1 si garda.
save = 0;
phi_r_in=[0 0; 5 0; 5.001 1; 10 1; 10.001 0; 15 0; 15.001 -1; 20 -1];
phi_l_in=[0 1; 5 1; 5.001 0; 10 0; 10.001 -1; 15 -1; 15.001 0; 20 0];

Simout= sim('Modelo_cinematico_2015.slx');



figure('pos', [10 10 1000 900])
plot(x_modelo_directo.Data, y_modelo_directo.Data, '--', x_modelo_desplazado.Data, y_modelo_desplazado.Data,'*',xe_centro_contra_desplazado.Data, ye_centro_contra_desplazado.Data)
legend('Posicion del centro','Posicion punto descentralizado', 'Posicion punto descentralizado ideal')
title('Posicion del robot respecto al tiempo')
xlabel('Desplazamiento en X [m]')
ylabel('Desplazamiento en Y [m]')

if save == 1
   print('../pictures/posicion_del_robot_modelo_cinematico', '-depsc'); 
end
%xsin ycos
figure
xdotsin=(xdot_modelo_directo.Data).*(sin(orientacion_modelo_directo.Data));
ydotcos=(ydot_modelo_directo.Data).*(cos(orientacion_modelo_directo.Data));
cero=xdotsin-ydotcos;
plot(orientacion_modelo_directo.Time,cero)
title('Restriccion de movimiento')
xlabel('Tiempo [s]')
ylabel('Error [m/s]')
if save==1
   print('../pictures/evaluacion_de_la_restriccion', '-depsc') 
end

%figure
%plot(ye_dot_in)
figure
plot(derecha_modelo_inverso)
hold
plot(izquierda_modelo_inverso)
title('Velocidad angular en las ruedas del Modelo Inverso')
xlabel('Tiempo [s]')
ylabel('Velocidad angular [rads/s]')
if save==1
    print('../pictures/velocidad_de_las_ruedas_obtenidas_del_modelo_inverso', '-depsc') 
end

figure
plot(omega_centro_contra_desplazamiento)
title('Velocidad angular respecto al tiempo')
ylabel('Velocidad angular [rads/s]')
xlabel('Tiempo [t]')

figure
plot(derecha_limitada)
hold
plot(izquierda_limitada)
title('Velocidad angular en las ruedas adaptada para ser mas realista')
xlabel('Tiempo [s]')
ylabel('Velocidad angular [rads/s]')
if save==1
    print('../pictures/velocidad_de_las_ruedas_con_limitantes_de_aceleracion', '-depsc') 
end

%figure
%plot(yedot_modelo_desplazado)
