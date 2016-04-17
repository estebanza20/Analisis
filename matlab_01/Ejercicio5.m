% Ejercicio 5

% Matrices del MVE del sistema
A = [-4, -1, 0, 3, -2, 0;
    -1, -2, 1, 0, 4, 3; 
    3, 0, -3, 2, -1, 2; 
    -3, 0, -4, -2, 1, -1; 
    1, -5, 0, -2, -1, -2; 
    -1, -3, -3, 0, 1, -1];

B = [-2; -1; -3; 0; 8; 3];


C = [-1, -1, 1, -1, 0, 1];

D = -1;


% Representación en el espacio de estados del sistema
G = ss(A,B,C,D);

% Polos del sistema
P = pole(G);

% Ceros del sistema
Z = zero(G);


% Diagrama de polos y ceros
h = pzplot(G);
opt = getoptions(h);
opt.Title.String = 'Diagrama de polos y ceros';
opt.XLabel.String = 'Eje real';
opt.YLabel.String = 'Eje imaginario';
setoptions(h, opt);


% Respuesta natural al estado x
x = [-1; -0.5; 2; -1; 1; 3];
[Y1,T] = initial(G,x);
figure
plot(T,Y1)
title('Respuesta del sistema al estado x')
xlabel('Tiempo (s)')
ylabel('Respuesta del sistema')



% Respuesta al impulso 
[Y2,T] = impulse(G);
figure
plot(T,Y2)
title('Respuesta del sistema a una entrada impulso')
xlabel('Tiempo (s)')
ylabel('Respuesta del sistema')


% Respuesta a una entrada escalón
[Y3,T] = step(G);
figure
plot(T,Y3)
title('Respuesta del sistema a una entrada escalón')
xlabel('Tiempo (s)')
ylabel('Respuesta del sistema')


%Señal cuadrada
[sig, T] = gensig('square', 15, 60, 0.01);
figure
plot(T, sig)
title('Señal de entrada - Onda cuadrada')
xlabel('Tiempo (s)')
ylabel('Señal cuadrada')

%Respuesta a la señal cuadrada
Y4 = lsim(G, sig, t);
figure
plot(T,Y4)
title('Respuesta del sistema a una señal cuadrada')
xlabel('Tiempo (s)')
ylabel('Respuesta del sistema')


% Función de transferencia
[Gnum, Gden] = ss2tf(A,B,C,D,1);
H = minreal(tf(Gnum, Gden))


