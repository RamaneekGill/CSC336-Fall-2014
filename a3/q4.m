

function y = perm_a(p, x)
	p_length = size(p);
	p_length = p_length(1);
	i = 1;

	while (i <= p_length)
		x([i p(i)],:) = x([p(i) i],:);
		i = i + 1;
	end
	y = x;

end //end of function