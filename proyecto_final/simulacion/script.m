%Este script es el script para hacer las graficas
Yedot=yedot.Data;
Xedot=xedot.Data;
Xdot=x.Data;
Ydot=y.Data;
Xe=xe.Data;
Ye=ye.Data;
X=x.Data;
Y=y.Data;
X_directo=x_directo.Data;
Y_directo=y_directo.Data;
Orientacion_Directo=orientacion_directo.Data;
Wheel_vel_rig=wheel_vel_rig.Data;
Wheel_vel_lef=wheel_vel_lef.Data;

%Modelo Directo
figure
plot(wheel_vel_lef)
hold
plot(wheel_vel_rig)

figure
plot(X_directo, Y_directo)


%Modelo desplazado respecto a central
figure
plot(X,Y, Xe, Ye)
legend('Posicion del centro','Posicion punto desplazado')