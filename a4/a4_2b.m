g1 = @(x) (x^2+2)/3;
g2 = @(x) sqrt(3*x - 2);
g3 = @(x) 3-(2/x);
g4 = @(x) (x^2-2)/(2*x-3); 

root = 2;

i = 0;
x = 2.336;
err = abs(x-root);

fprintf(' i 	x 		err 			ratio\n');
fprintf('~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~\n');

fprintf('|%3d | %20.12e | %20.12e |\n', i, x, err);

while i < 10
	x = g1(x);
	new_err = abs(x-root);
	ratio = new_err/err;
	err = new_err;

	fprintf('|%3d | %20.12e | %20.12e | %20.12e |\n', i, x, err, ratio);

	i = i + 1;

end
