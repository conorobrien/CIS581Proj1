function [ ahead, behind ] = getGradientNeighbors(local, theta )

if theta == pi
    theta_mod = pi;
else
theta_mod = mod(theta, pi);
end

if (theta_mod >= 0 && theta_mod <= pi/4)
    points1 = local(2:-1:1, 3);
    points2 = local(2:3, 1);
    interpolated1 = interp1([0 1], points1, abs(tan(theta_mod)));
    interpolated2 = interp1([0 1], points2, abs(tan(theta_mod)));

elseif (theta_mod > pi/4 && theta_mod <= pi/2)
    points1 = local(1, 2:3);
    points2 = local(3, 2:-1:1);
    interpolated1 = interp1([0 1], points1, abs(cot(theta_mod)));
    interpolated2 = interp1([0 1], points2, abs(cot(theta_mod)));

elseif (theta_mod > pi/2 && theta_mod <= 3*pi/4)
    points1 = local(1, 2:-1:1);
    points2 = local(3, 2:3);
    interpolated1 = interp1([0 1], points1, abs(cot(theta_mod)));
    interpolated2 = interp1([0 1], points2, abs(cot(theta_mod)));

elseif (theta_mod > 3*pi/4 && theta_mod <= pi)
    points1 = local(2:-1:1, 1);
    points2 = local(2:3, 3);
    interpolated1 = interp1([0 1], points1, abs(tan(theta_mod)));
    interpolated2 = interp1([0 1], points2, abs(tan(theta_mod)));
end

if theta >= 0
    ahead = interpolated1;
    behind = interpolated2;
else
    ahead = interpolated2;
    behind = interpolated1;
end

end

