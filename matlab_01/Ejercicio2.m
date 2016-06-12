%Punto a
A=randi(10,10,10)

%Punto b
VecProp= eig(A, 'matrix');
valoProp=eig(A);

% Punto c
B=randi(10,10,3);

%Punto d
C = A*B
Size_C = size(C);
Max_C = max(C(:));
Min_C = min(C(:));

%Punto e

x = A(5,2)*B(9,3)*C(5,3)

%Punto f

concavec = cat(2,A(3,:),B(6,:))

%Punto g

Goku = diag(diag(A))
Vegueta = inv(Goku)

%Punto h

M = magic(20)

sudoku = sum(M)

wow = sum(diag(M))

plot(M)