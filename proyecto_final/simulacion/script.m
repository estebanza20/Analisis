%Este script es el script para hacer las graficas

%la variable save es para determinar si se desan guardar las graficas
%automaticamente. save = 0 no guarda. save = 1 si guarda.
save = 0;
%la variable simulacion es para determinar la entrada al modelo
simulacion=2;
t=0:0.01:20;
if simulacion==0
    %generar un cradrado a rapidez constante
    xe_dot_in=[t; heaviside(t-5)-heaviside(t-10)-heaviside(t-15)].';
    ye_dot_in=[t; heaviside(t)-heaviside(t-5)-heaviside(t-10)+heaviside(t-15)].';
    %xe_dot_in=[0 0; 5 0; 5.001 1; 10 1; 10.001 0; 15 0; 15.001 -1; 20 -1];
    %ye_dot_in=[0 1; 5 1; 5.001 0; 10 0; 10.001 -1; 15 -1; 15.001 0; 20 0];
    figure('pos', [10 10 1000 900])
    plot(t,xe_dot_in(:,2),'--',t,ye_dot_in(:,2))
    title('Entrada al modelo')
    xlabel('Tiempo [s]')
    ylabel('Velocidad del punto descentralizado [m/s]')
    legend('Movimiento en x', 'Movimiento en y')
    if save==1
        print('../pictures/entrada_trayectoria_cuadrada', '-depsc');
    end
end

if simulacion==1
    %generar un circulo a rapidez constante
    xe_dot_in=[t ; 2*sin(t)].';
    ye_dot_in=[t ; 2*cos(t)].';
    figure('pos', [10 10 1000 900])
    plot(t,xe_dot_in(:,2),'--',t,ye_dot_in(:,2))
    title('Entrada al modelo')
    xlabel('Tiempo [s]')
    ylabel('Velocidad del punto descentralizado [m/s]')
    legend('Movimiento en x', 'Movimiento en y')
    if save==1
        print('../pictures/entrada_trayectoria_circular', '-depsc');
    end
end

if simulacion==2
    %generar un cuadrado a rapidez no constante
    
    temporal_xe=heaviside(t-5).*(1-cos((t-5)*pi/2.5))-heaviside(t-10).*(1-cos((t-5)*pi/2.5))-heaviside(t-15).*(1-cos((t-15)*pi/2.5));
    temporal_ye=heaviside(t).*(1-cos(t*pi/2.5))-heaviside(t-5).*(1-cos(t*pi/2.5))-heaviside(t-10).*(1-cos((t-10)*pi/2.5))+heaviside(t-15).*(1-cos((t-10)*pi/2.5));
    xe_dot_in=[t ; 0.5*temporal_xe].';
    ye_dot_in=[t; 0.5*temporal_ye].';
    figure('pos', [10 10 1000 900])
    plot(t,xe_dot_in(:,2),'--',t,ye_dot_in(:,2))
    title('Entrada al modelo')
    xlabel('Tiempo [s]')
    ylabel('Velocidad del punto descentralizado [m/s]')
    legend('Movimiento en x', 'Movimiento en y')
    if save==1
        print('../pictures/entrada_trayectoria_cuadrada_suavizada', '-depsc');
    end
end


Simout= sim('Modelo_cinematico.slx');



figure('pos', [10 10 1000 900])
plot(x_modelo_directo.Data, y_modelo_directo.Data, '--', x_modelo_desplazado.Data, y_modelo_desplazado.Data,xe_centro_contra_desplazado.Data, ye_centro_contra_desplazado.Data, '-.')
legend('Posicion del centro','Posicion punto descentralizado', 'Posicion punto descentralizado ideal')
title('Posicion del robot respecto al tiempo')
xlabel('Desplazamiento en X [m]')
ylabel('Desplazamiento en Y [m]')

if save == 1
    if simulacion==0
    print('../pictures/posicion_del_robot_modelo_cinematico_cuadrado', '-depsc'); 
    end
    if simulacion==1
    print('../pictures/posicion_del_robot_modelo_cinematico_circulo', '-depsc'); 
    end
    if simulacion==2
    print('../pictures/posicion_del_robot_modelo_cinematico_cuadrado_suavizado', '-depsc'); 
    end
end
%xsin ycos
figure('pos', [10 10 1000 900])
xdotsin=(xdot_modelo_directo.Data).*(sin(orientacion_modelo_directo.Data));
ydotcos=(ydot_modelo_directo.Data).*(cos(orientacion_modelo_directo.Data));
%xdotsin=(xdot_centro_contra_desplazado.Data).*(sin(orientacion_centro_contra_desplazado.Data));
%ydotcos=(ydot_centro_contra_desplazado.Data).*(cos(orientacion_centro_contra_desplazado.Data));
cero=xdotsin-ydotcos;
plot(orientacion_modelo_directo.Time,cero)
title('Restriccion de movimiento')
xlabel('Tiempo [s]')
ylabel('Error [m/s]')
if save==1
    if simulacion==0
    print('../pictures/evaluacion_de_la_restriccion_cuadrado', '-depsc')
    end
    if simulacion==1
    print('../pictures/evaluacion_de_la_restriccion_circulo', '-depsc')
    end
    if simulacion==2
    print('../pictures/evaluacion_de_la_restriccion_cuadrado_suavizado', '-depsc')
    end
end



%figure
%plot(ye_dot_in)
figure('pos', [10 10 1000 900])
plot(derecha_modelo_inverso)
hold
plot(izquierda_modelo_inverso)
title('Velocidad angular en las ruedas del Modelo Inverso')
xlabel('Tiempo [s]')
ylabel('Velocidad angular [rads/s]')
legend('Rueda derecha','Rueda izquierda')
if save==1
    if simulacion ==0
    print('../pictures/velocidad_de_las_ruedas_obtenidas_del_modelo_inverso_cuadrado', '-depsc')
    end
    if simulacion ==1
    print('../pictures/velocidad_de_las_ruedas_obtenidas_del_modelo_inverso_circulo', '-depsc')
    end
    if simulacion ==2
    print('../pictures/velocidad_de_las_ruedas_obtenidas_del_modelo_inverso_cuadrado_suavizado', '-depsc')
    end
end

figure('pos', [10 10 1000 900])
plot(omega_centro_contra_desplazado)
title('Velocidad angular respecto al tiempo')
ylabel('Velocidad angular [rads/s]')
xlabel('Tiempo [t]')

figure('pos', [10 10 1000 900])
plot(derecha_limitada)
hold
plot(izquierda_limitada)
title('Velocidad angular en las ruedas adaptada para ser mas realista')
xlabel('Tiempo [s]')
ylabel('Velocidad angular [rads/s]')
legend('Rueda derecha','Rueda izquierda')
if save==1
    if simulacion==0
    print('../pictures/velocidad_de_las_ruedas_con_limitantes_de_aceleracion_cuadrado', '-depsc')
    end
    if simulacion==1
    print('../pictures/velocidad_de_las_ruedas_con_limitantes_de_aceleracion_circulo', '-depsc')
    end
    if simulacion==2
    print('../pictures/velocidad_de_las_ruedas_con_limitantes_de_aceleracion_cuadrado_suavizado', '-depsc')
    end
end

%figure
%plot(yedot_modelo_desplazado)
