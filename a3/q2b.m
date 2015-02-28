format long;
warning('off', 'all');

b_hat = zeros(2,1);
b_hat(2,1) = 1;

p = zeros(2,2);
p(2,2) = 1;
p(1,1) = 1;

L = zeros(2,2);
L(1,1) = 1;
L(2,2) = 1;

U = zeros(2,2);
U(1,1) = 1;
U(1,2) = 1;

k = 1;
while (k <= 10)
	gamma = 10^(-2*k);
	b_hat(2,1) = 2-gamma;
	L(2,1) = gamma;
	U(1,1) = gamma;
	U(2,2) = 1/gamma;

	y = L\b_hat;
	x = U\y;	

	disp(['k is ', num2str(k), ' x is ']);
	disp(x);

	k = k + 1;
end