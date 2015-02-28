format long;
warning('off', 'all');

b = zeros(2,1);
b(2,1) = 1;

L = zeros(2,2);
L(1,1) = 1;
L(2,2) = 1;

U = zeros(2,2);
U(1,2) = 1;

k = 1;
while (k <= 10)
	gamma = 10^(-2*k);
	b(1,1) = 2-gamma;
	L(2,1) = 1/gamma;
	U(1,1) = gamma;
	U(2,2) = 1 - (1/gamma);

	y = L\b;
	x_hat = U\y;	

	A = L*U;
	r = b-A*x_hat;

	z = L\r;
	e = U\z;

	x_tilda = x_hat + e;

	disp(['k is ', num2str(k), ' x_tilda is ']);
	disp(x_tilda);

	k = k + 1;
end