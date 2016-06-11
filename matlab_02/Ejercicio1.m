%Laboratorio 2 Matlab
%resolver:
%   xdot=a(by-x)
%   ydot=cx-xz
%   z=xy-bz

%La variable ploteo se utiliza para seleccionar cual de las simulaciones
%se desea graficar. 0 para ninguna. 1 para la primera, y asi sucesivamente.
%6 indica que se grafican los estados respecto al tiempo.
ploteo=0;
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
    
    xlabel('Estado X');
    ylabel('Estado Y');
    zlabel('Estado Z');
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

%Para la segunda simulacion, cambiando b
b=8.5;
[t_sim_2,x_sim_2] = ode45(@(t_sim_2,x_sim_2) odefun(t_sim_2,x_sim_2,a,b,c), tspan, x0);
%el valor final se imprime
valor_final_segunda_simulacion=x_sim_2(end,:)

if ploteo==2
    figure;
    surface([x_sim_2(:,1), x_sim_2(:,1)], [x_sim_2(:,2), x_sim_2(:,2)], [x_sim_2(:,3), x_sim_2(:,3)], [t_sim_2, t_sim_2], 'EdgeColor', 'flat');
    colorbar;
    view([-18 28])
    xlabel('Estado X');
    ylabel('Estado Y');
    zlabel('Estado Z');
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

%Para la tercera simulacion cambiando b
b=8.6;
[t_sim_3,x_sim_3] = ode45(@(t_sim_3,x_sim_3) odefun(t_sim_3,x_sim_3,a,b,c), tspan, x0);
%El valor final se imprime
valor_final_tercera_simulacion=x_sim_3(end,:)

if ploteo==3
    figure;
    surface([x_sim_3(:,1), x_sim_3(:,1)], [x_sim_3(:,2), x_sim_3(:,2)], [x_sim_3(:,3), x_sim_3(:,3)], [t_sim_3, t_sim_3], 'EdgeColor', 'flat');
    colorbar;
    view([-18 28])
    
    xlabel('Estado X');
    ylabel('Estado Y');
    zlabel('Estado Z');
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


%Para la cuarta simulacion, cambiando estado inicial
x0=[-2.3 1.3 -10];
b=4.85;
[t_sim_4,x_sim_4] = ode45(@(t_sim_4,x_sim_4) odefun(t_sim_4,x_sim_4,a,b,c), tspan, x0);
%El valor final se imprime
valor_final_caurta_simulacion=x_sim_4(end,:)

if ploteo==4
    figure;
    surface([x_sim_4(:,1), x_sim_4(:,1)], [x_sim_4(:,2), x_sim_4(:,2)], [x_sim_4(:,3), x_sim_4(:,3)], [t_sim_4, t_sim_4], 'EdgeColor', 'flat');
    colorbar;
    view([-18 28])
    
    xlabel('Estado X');
    ylabel('Estado Y');
    zlabel('Estado Z');
    if os==0
        %se guardan las graficas en diferentes views. Este path depende de
        %utilizar el script en Linux y que el directorio pictures exita
        print( 'pictures/cuarta_simulacion', '-depsc');
        view([90 0]) %yz view
        print( 'pictures/cuarta_simulacion_yz', '-depsc');
        view([0 90]) %xy view
        print( 'pictures/cuarta_simulacion_xy', '-depsc');
        view([0 0]) %xz view
        print( 'pictures/cuarta_simulacion_xz', '-depsc');
    end
end



%Para la quinta simulacion
b=4.85;
x0=[0.1 -1 -1];
[t_sim_5,x_sim_5] = ode45(@(t_sim_5,x_sim_5) odefun(t_sim_5,x_sim_5,a,b,c), tspan, x0);
%El valor final se imprime
valor_final_quinta_simulacion=x_sim_5(end,:)

if ploteo==5
    figure;
    surface([x_sim_5(:,1), x_sim_5(:,1)], [x_sim_5(:,2), x_sim_5(:,2)], [x_sim_5(:,3), x_sim_5(:,3)], [t_sim_5, t_sim_5], 'EdgeColor', 'flat');
    colorbar;
    view([-18 28])
    
    xlabel('Estado X');
    ylabel('Estado Y');
    zlabel('Estado Z');
    if os==0
        %se guardan las graficas en diferentes views. Este path depende de
        %utilizar el script en Linux y que el directorio pictures exita
        print( 'pictures/quinta_simulacion', '-depsc');
        view([90 0]) %yz view
        print( 'pictures/quinta_simulacion_yz', '-depsc');
        view([0 90]) %xy view
        print( 'pictures/quinta_simulacion_xy', '-depsc');
        view([0 0]) %xz view
        print( 'pictures/quinta_simulacion_xz', '-depsc');
    end
end

%plot de comparacion entre todos
if ploteo==6
    k1 = find(t_sim_1>10.0);
    ten1=k1(1);
    k2=find(t_sim_2>10.0);
    ten2=k2(1);
    k3=find(t_sim_3>10.0);
    ten3=k3(1);
    k4=find(t_sim_4>10.0);
    ten4=k4(1);
    k5=find(t_sim_5>10.0);
    ten5=k5(1);
    %definidas las variables para el tiempo correcto, se grafican los
    %resultados.
    figure
    subplot(3,1,1)
    plot(t_sim_1(1:ten1),x_sim_1(1:ten1,1), 'r', t_sim_2(1:ten2),x_sim_2(1:ten2,1),'g', t_sim_3(1:ten3),x_sim_3(1:ten3,1),'b', t_sim_4(1:ten4),x_sim_4(1:ten4,1),'m', t_sim_5(1:ten5),x_sim_5(1:ten5,1),'c')
    xlabel('Tiempo t')
    ylabel('Estados X')
    
    subplot(3,1,2)
    plot(t_sim_1(1:ten1),x_sim_1(1:ten1,2), 'r', t_sim_2(1:ten2),x_sim_2(1:ten2,2),'g', t_sim_3(1:ten3),x_sim_3(1:ten3,2),'b', t_sim_4(1:ten4),x_sim_4(1:ten4,2),'m', t_sim_5(1:ten5),x_sim_5(1:ten5,2),'c' )
    xlabel('Tiempo t')
    ylabel('Estados Y')
    
    subplot(3,1,3)
    plot(t_sim_1(1:ten1),x_sim_1(1:ten1,3), 'r', t_sim_2(1:ten2),x_sim_2(1:ten2,3),'g', t_sim_3(1:ten3),x_sim_3(1:ten3,3),'b', t_sim_4(1:ten4),x_sim_4(1:ten4,3),'m', t_sim_5(1:ten5),x_sim_5(1:ten5,3),'c')
    xlabel('Tiempo t')
    ylabel('Estados Z')
    
    
    if os==0
        print( 'pictures/comparacion', '-depsc');
    end
end

%esta variable se asigna a 1 si se quiere hacer el analisis de sensibilidad
%al cambio de los parametros.
comparacion_de_sensibilidad=0;

if comparacion_de_sensibilidad==1
    b=4.85:0.05:8.6;
    [dontcare, m]=size(b);
    xf=zeros(1, m);
    yf=zeros(1,m);
    zf=zeros(1,m);
    a=10;
    c=10;
    tspan=[0 200];
    x0=[2.3 -1.3 10];
    for n=1:m
        x=0;
        %se simula para un b especifico
        [t,x] = ode45(@(t,x) odefun(t,x,a,b(n),c), tspan, x0);
        kapa=x(end,:);
        xf(n)=kapa(1);
        yf(n)=kapa(2);
        zf(n)=kapa(3);
        %[xf(n), yf(n), zf(n)]=kapa;
    end
    figure
    plot(b, xf, b, yf, b, zf)
    xlabel('Parametro b');
    ylabel('Valor final de los Estados')
    legend('X final', 'Y final', 'Z final');
    if os==0
        print( 'pictures/sensibilidad', '-depsc');
    end
end



