%Laboratorio 2 Matlab
%resolver:
%   xdot=a(by-x)
%   ydot=cx-xz
%   z=xy-bz

%La variable ploteo se utiliza para seleccionar cual de las simulaciones
%se desea graficar. 0 para ninguna. 1 para la primera, y asi sucesivamente.
%4 indica que se grafican los estados respecto al tiempo.
ploteo=1;
%la variable os se utiliza para seleccionar el sistema operativo donde se 
%corre el script. 0 para linux, 1 para cualquier otro. 
os=0;
%Para la primera simulacion:
tspan=[0 200];
a=10;
b=4.85;
c=10;
x0=[2.3 -1.3 10];
[t_sim_1,x_sim_1] = ode45(@(t_sim_1,x_sim_1) odefun(t_sim_1,x_sim_1,a,b,c), tspan, x0);
%el valor final se imprime
valor_final_primera_simulacion=x_sim_1(end,:)

if ploteo==1
    figure;
    surface([x_sim_1(:,1), x_sim_1(:,1)], [x_sim_1(:,2), x_sim_1(:,2)], [x_sim_1(:,3), x_sim_1(:,3)], [t_sim_1, t_sim_1], 'EdgeColor', 'flat');
    colorbar;
    view([-18 28])
    if os==0
        %se guardan las graficas en diferentes views. Este path depende de
        %utilizar el script en Linux y que el directorio pictures exista
        print( 'pictures/primera_simulacion', '-depsc');
        view([90 0]) %yz view
        print( 'pictures/primera_simulacion_yz', '-depsc');
        view([0 90]) %xy view
        print( 'pictures/primera_simulacion_xy', '-depsc');
        view([0 0]) %xz view
        print( 'pictures/primera_simulacion_xz', '-depsc');
    end
end

%Para la segunda simulacion
b=8.5;
x0=[-2.3 1.3 -10];
[t_sim_2,x_sim_2] = ode45(@(t_sim_2,x_sim_2) odefun(t_sim_2,x_sim_2,a,b,c), tspan, x0);
%el valor final se imprime
valor_final_segunda_simulacion=x_sim_2(end,:)

if ploteo==2
    figure;
    surface([x_sim_2(:,1), x_sim_2(:,1)], [x_sim_2(:,2), x_sim_2(:,2)], [x_sim_2(:,3), x_sim_2(:,3)], [t_sim_2, t_sim_2], 'EdgeColor', 'flat');
    colorbar;
    view([-18 28])
    if os==0
        %se guardan las graficas en diferentes views. Este path depende de
        %utilizar el script en Linux y que el directorio pictures exista
        print( 'pictures/segunda_simulacion', '-depsc');
        view([90 0]) %yz view
        print( 'pictures/segunda_simulacion_yz', '-depsc');
        view([0 90]) %xy view
        print( 'pictures/segunda_simulacion_xy', '-depsc');
        view([0 0]) %xz view
        print( 'pictures/segunda_simulacion_xz', '-depsc');
    end
end

%Para la tercera simulacion
b=8.6;
x0=[0.1 -1 -1];
[t_sim_3,x_sim_3] = ode45(@(t_sim_3,x_sim_3) odefun(t_sim_3,x_sim_3,a,b,c), tspan, x0);
%El valor final se imprime
valor_final_tercera_simulacion=x_sim_3(end,:)

if ploteo==3
    figure;
    surface([x_sim_3(:,1), x_sim_3(:,1)], [x_sim_3(:,2), x_sim_3(:,2)], [x_sim_3(:,3), x_sim_3(:,3)], [t_sim_3, t_sim_3], 'EdgeColor', 'flat');
    colorbar;
    view([-18 28])
    if os==0
        %se guardan las graficas en diferentes views. Este path depende de
        %utilizar el script en Linux y que el directorio pictures exita
        print( 'pictures/tercera_simulacion', '-depsc');
        view([90 0]) %yz view
        print( 'pictures/tercera_simulacion_yz', '-depsc');
        view([0 90]) %xy view
        print( 'pictures/tercera_simulacion_xy', '-depsc');
        view([0 0]) %xz view
        print( 'pictures/tercera_simulacion_xz', '-depsc');
    end
end

%plot de comparacion entre todos
if ploteo==4
    k1 = find(t_sim_1>10.0);
    ten1=k1(1);
    k2=find(t_sim_2>10.0);
    ten2=k2(1);
    k3=find(t_sim_3>10.0);
    ten3=k3(1);
    figure
    subplot(3,1,1)
    plot(t_sim_1(1:ten1),x_sim_1(1:ten1,1), t_sim_2(1:ten2),x_sim_2(1:ten2,1), t_sim_3(1:ten3),x_sim_3(1:ten3,1))
    subplot(3,1,2)
    plot(t_sim_1(1:ten1),x_sim_1(1:ten1,2), t_sim_2(1:ten2),x_sim_2(1:ten2,2), t_sim_3(1:ten3),x_sim_3(1:ten3,2))
    subplot(3,1,3)
    plot(t_sim_1(1:ten1),x_sim_1(1:ten1,3), t_sim_2(1:ten2),x_sim_2(1:ten2,3), t_sim_3(1:ten3),x_sim_3(1:ten3,3))
    if os==0
        print( 'pictures/comparacion', '-depsc');
    end
end



