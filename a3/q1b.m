format long;
warning('off', 'all');

b = zeros(2,1);
b(2,1) = 1;

p = zeros(2,2);
p(1,2) = 1;
p(2,1) = 1;

L = zeros(2,2);
L(1,1) = 1;
L(2,2) = 1;

U = zeros(2,2);
U(1,1) = 1;
U(1,2) = 1;

k = 1;
while (k <= 10)
	gamma = 10^(-2*k);
	b(1,1) = 2-gamma;
	L(2,1) = gamma;
	U(2,2) = 1-gamma;

	b_hat = p*b;

	y = L\b_hat;
	x = U\y;	

	disp(['k is ', num2str(k), ' x is ']);
	disp(x);

	k = k + 1;
end