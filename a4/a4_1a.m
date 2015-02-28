n = [0,1,2,3,4,5];
x=1;
x_of_i = x - sqrt(2);
fprintf(' n 	x(n) 			x(n) - sqrt(2)\n~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~\n');
for i = 0:5
	new_x = x-(x^2 - 2)/(2*x);
	x_of_i = x - sqrt(2);
	fprintf('%2d 	%1.15e 	%1.15e\n',n(i+1), x, x_of_i);
	x = new_x;
end