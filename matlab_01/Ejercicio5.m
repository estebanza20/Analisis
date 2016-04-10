% Ejercicio 5


% Definición de las matrices del sistema
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
pz = pzplot(G)
%grid on
opt = getoptions(pz);
opt.Title.String = 'Diagrama de polos y ceros';
opt.XLabel.String = 'Eje real';
opt.YLabel.String = 'Eje imaginario)';
setoptions(pz, opt);

%title('Diagrama de polos y ceros')
%xlabel('Eje real (s^{-1})')
%ylabel('Eje imaginario (s^{-1})')


% Respuesta natural al estado x
x = [-1; -0.5; 2; -1; 1; 3];
initial(G, x);

% Respuesta al impulso
% 
impulse(G);

% Respuesta a una entrada escalón
step(G);


% Respuesta a una señal cuadrada
[sig, t] = gensig('square', 15, 60, 0.01);
%plot(t, sig)
lsim(G, sig, t);


% Función de transferencia
[Gnum, Gden] = ss2tf(A,B,C,D,1);
H = minreal(tf(Gnum, Gden))


