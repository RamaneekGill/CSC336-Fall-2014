function y = perm_c(q,x)
	q_size = size(q);
	q_size = max(q_size(1), q_size(2));
	p = zeros(size(q));
	i = 1;
	while(i <= q_size)
		j = 1;
		while(j <= q_size)
			if(j == q(i))
				p(i,j) = 1;
			end
			j = j + 1;
		end
		i = i + 1;
	end
	y = p*x;

end