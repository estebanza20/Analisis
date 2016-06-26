%Simulación y graficación modelo dinámico

mode = 1;
print_figs = 1;

%Parametros del modelo:

%Factor de amortiguamiento
B = 0.001;
%Masas
mc = 30;
mw = 1;
%Momentos de inercia
Iw = 0.005;
Im = 0.0025;
Io = 15.625;
%Dimensiones
s = 0.3;
b = 0.75;
r = 0.1;

%Masa equivalente
D = mc + 2*mw + 2*(Iw/(r^2));

%Momento de inercia equivalente
J = Io + 2*mw*b^2 + 2*Im + 2*(b^2)*(Iw/(r^2));


%Condiciones iniciales:
x0 = 0;
y0 = 0;
theta0 = 0;
w0 = 0;
v0 = 0;

%Generación de las entradas del sistema:
if mode == 0
    t = magnitud_velocidad_traslacional.Time;
    v = magnitud_velocidad_traslacional.Data;
    w = omega_centro_contra_desplazamiento.Data;
    wdot = zeros(length(w),1);
    vdot = zeros(length(v),1);

    for i=2:length(v)
        vdot(i) = (v(i)-v(i-1))/(t(i)-t(i-1));
        wdot(i) = (w(i)-w(i-1))/(t(i)-t(i-1));
    end
    vdot(1) = vdot(2);
    wdot(1) = wdot(2);


    Fm = D*vdot + ((2*B)/(r^2))*v - mc*s*w.^2;
    Tm = J*wdot + ((2*B*(b^2))/(r^2))*w + mc*s*w.*v;

    tau_r = (r/2)*(Fm + (1/b)*Tm);
    tau_l = (r/2)*(Fm - (1/b)*Tm);

    figure
    plot(t,v,t,w);  
    
else
    t = (0:0.01:150)';
    
    tau_r = zeros(length(t),1);
    tau_l = zeros(length(t),1); 
    
    for k=0:10
        tau_r = -heaviside(t); %tau_r + 0.1*(t-5*(2*k)).*(heaviside(t-5*(2*k))-heaviside(t-5*(2*k+1)));
    end

    for k=0:10
        tau_l = heaviside(t);  
         %0.1*heaviside(t); %20*cos(t); %tau_l - 0.01*(t-5*(2*k)).*(heaviside(t-5*(2*k))-heaviside(t-5*(2*k+1)));
    end
end

%Simulación
sim_time = 150;
Simout= sim('dynamic_model.slx');

t = x_y.time;

%Entradas del sistema
tau_r = tau_rl.signals(1).values;
tau_l = tau_rl.signals(2).values;

%Salidas del sistema
x = x_y.signals(1).values;
y = x_y.signals(2).values;
theta = theta_w_v.signals(1).values;
w = theta_w_v.signals(2).values;
v = theta_w_v.signals(3).values;
phi_l_dot = phi_lr_dot.signals(1).values;
phi_r_dot = phi_lr_dot.signals(2).values;


%Graficación:
test = 'Simulación torques opuestos';

%Torques de entrada
figure(1)
plot(t,tau_r,t,tau_l);
legend({'$\tau_r(t)$: Rueda derecha';'$\tau_l(t)$: Rueda izquierda'},'Interpreter','latex');
title({'Torques de entrada al sistema:'; test});
ylabel('Torque (Nm)');
xlabel('Tiempo (s)');
if print_figs == 1
    print(['../pictures/sim_modelo_dinamico/torques_m_dinamico-' strrep(test,' ','_')],'-depsc', '-r200');
end


%Trayectoria del robot
figure(2)
plot(x,y)
%axis([0 37.5 0 1400])
title({'Trayectoria del robot:'; test});
%title('Trayectoria del robot');
ylabel('Posición en Y (m)');
xlabel('Posición en X (m)');
if print_figs == 1
    print(['../pictures/sim_modelo_dinamico/trayect_m_dinamico-' strrep(test,' ','_')],'-depsc', '-r200');
end

%Posición con respecto al tiempo
figure(3)
plot(t,x,t,y)
legend({'x(t): Coordenada en X';'y(t): Coordenada en Y'},'Interpreter','latex');
%axis([0 37.5 0 1400])
title({'Posición del robot en función del tiempo:'; test});
%title('Posición del robot en función del tiempo');
ylabel('Posición (m)');
xlabel('Tiempo (s)');
if print_figs == 1
    print(['../pictures/sim_modelo_dinamico/posicion_vs_tiempo-' strrep(test,' ','_')],'-depsc', '-r200');
end

%Velocidades v y w con respecto al tiempo
figure(4)
subplot(2,1,1)
plot(t,v)
title({'Velocidad v en función del tiempo:'; test});
%title('Velocidad v(t)');
ylabel({'Velocidad';'traslacional (m/s)'});
xlabel('Tiempo (s)');
subplot(2,1,2)
plot(t,w)
title({'Velocidad \omega en función del tiempo:'; test});
%title('Velocidad \omega(t)');
ylabel({'Velocidad';'angular (rad/s)'});
xlabel('Tiempo (s)');
if print_figs == 1
    print(['../pictures/sim_modelo_dinamico/v_w_vs_tiempo-' strrep(test,' ','_')],'-depsc', '-r200');
end

%Velocidades angulares ruedas con respecto al tiempo
figure(5)
plot(t,phi_r_dot,t,phi_l_dot);
legend({'$\dot{\varphi_r}(t)$: Rueda derecha';'$\dot{\varphi_l}(t)$: Rueda izquierda'},'Interpreter','latex');
title({'Velocidad angular en las ruedas en función del tiempo:'; test});
ylabel('Velocidad angular (rad/s)');
xlabel('Tiempo (s)');
if print_figs == 1
    print(['../pictures/sim_modelo_dinamico/phi_dot_rl_vs_tiempo-' strrep(test,' ','_')],'-depsc', '-r200');
end















