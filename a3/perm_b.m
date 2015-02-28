function q = perm_b(p)
	p_length = size(p);
	p_length = max(p_length(1), p_length(2));

	x = eye(p_length + 1);
	q = zeros(1, p_length + 1);
	i = 1;
	
	while (i <= p_length)
		x([i p(i)],:) = x([p(i) i],:);
		i = i + 1;
	end

	i = 1;
	x_size = size(x);

	while(i <= x_size(1))
		j = 1;
		while(j <= x_size(2))
			if(x(i,j) == 1)
				q(i) = j;
			end
			j = j + 1;
		end
		i = i + 1;
	end
	
end