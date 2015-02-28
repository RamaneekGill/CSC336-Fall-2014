R = 0.082054;
b = 0.04267;
a = 3.592;
K = 300;

fprintf('p   v(gas law) v(van der Walls) \n');
fprintf('~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~\n');
for i = 1:3
	pressure = 10^(i-1);
	f = @(v) (pressure + a/v^2) * (v - b) - R * K;
	v_law = R * K/pressure;
	v_van = fzero(f, v_law);
	fprintf('|%4.0f | %10.7f | %10.12f | \n', pressure, v_law, v_van);
end