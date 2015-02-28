f = @(x) x^2 - 2;
n = [0,1,2,3,4,5,6,7];
x(1) = 1;
x(2) = 2;
x_of_i(1) = x(1) - sqrt(2);
x_of_i(2) = x(2) - sqrt(2);

for j = 3:8
	x(j) = ((x(j-2)*f(x(j-1))) - (x(j-1)*f(x(j-2))))/(f(x(j-1)) - f(x(j-2)));
	x_of_i(j) = x(j) - sqrt(2);
end

fprintf(' n 	x(n) 				x(n) - sqrt(2)\n~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~\n');

for i = 1:8
	fprintf('%2d 	%1.15e	%1.15e\n',n(i), x(i), x_of_i(i));
end