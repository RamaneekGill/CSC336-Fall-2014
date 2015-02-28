

function y = perm_a(p, x)
	p_length = size(p);
	p_length = max(p_length(1), p_length(2));
	i = 1;
	y=x;

	while (i <= p_length)
		y([i p(i)],:) = y([p(i) i],:);
		i = i + 1;
	end

end