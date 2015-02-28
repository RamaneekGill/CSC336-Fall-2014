n = 60;
A = ones(n,n);
A = A - triu(A);
A = eye(n) - A;
A = A + [ones(n-1, 1); 0] * [zeros(1,n-1),1];
Q =diag(ones(n-1,1),1);
Q(n-1) = 1;   

[L1, U1, P1] = lu(A);
U1(n,n)  %for verifying it is == 2^(n-1)
[L2, U2] = lu(A*Q);
max(max(abs(U2)))  %for verifying == 2

x = ones(n,1);
b = A*x;
y = L1\b;
x1 = U1\y;
norm(x-x1, inf)

y2 = L2\b; 
z = U2\y2;
x2 = Q * z;
norm(x-x2, inf)