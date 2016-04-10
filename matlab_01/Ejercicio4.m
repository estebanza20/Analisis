% Ejercicio 4.

%Simulación del diagrama de bloques
sim('Ejercicio4_simulink');

%Ca(t)
figure
plot(tout, Ca(:,2))
grid on
title('Variable de estado C_a(t)')
xlabel('Tiempo (s)')
ylabel('C_a(t)')


%Cb(t)
figure
plot(tout, Cb(:,2))
grid on
title('Variable de estado C_b(t)')
xlabel('Tiempo (s)')
ylabel('C_b(t)')


%Cx(t)
figure
plot(tout, Cx(:,2))
grid on
title('Variable de estado C_x(t)')
xlabel('Tiempo (s)')
ylabel('C_x(t)')


%Cy(t)
figure
plot(tout, Cy(:,2))
grid on
title('Variable de estado C_y(t)')
xlabel('Tiempo (s)')
ylabel('C_y(t)')

%Cz(t)
figure
plot(tout, Cz(:,2))
grid on
title('Variable de estado C_z(t)')
xlabel('Tiempo (s)')
ylabel('C_z(t)')

