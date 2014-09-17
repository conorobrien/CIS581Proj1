function m = localMax(local, theta)

	ang = mod(theta, pi);

    if (ang >= 0) && (ang < pi/4)
		next = local(2:-1:1, 3);
		prev = local(2:3, 1);
        interp_next = interp1([0 1], next, sin(ang));
        interp_prev = interp1([0 1], prev, sin(ang));

	elseif (ang >= pi/4) && (ang < pi/2)
		next = local(1,2:3);
		prev = local(3, 2:-1:1);
        interp_next = interp1([0 1], next, cos(ang));
        interp_prev = interp1([0 1], prev, cos(ang));

	elseif (ang >= pi/2) && (ang < 3*pi/4)
		next = local(2:-1:1, 1);
		prev = local(2:3, 3);
        interp_next = interp1([0 1], next, cos(ang));
        interp_prev = interp1([0 1], prev, cos(ang));

	elseif (ang >= 3*pi/4) && (ang <= pi)
		next = local(2:-1:1, 1);
		prev = local(2:3, 3);
        interp_next = interp1([0 1], next, sin(ang));
        interp_prev = interp1([0 1], prev, sin(ang));
    end
    
    if (local(2,2) > interp_next) && (local(2,2) > interp_prev)
		m = true;
    else
        m = false;
    end
    
end