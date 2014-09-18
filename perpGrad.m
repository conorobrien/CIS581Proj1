function [ newR, newC ] = perpGrad( R, C, theta, direction )
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here

if (strcmp (direction, 'left'))
    theta = theta + pi/2;
else 
    theta = theta - pi/2;
end

if (theta > pi)
    theta = theta - 2*pi;
elseif (theta < -pi)
    theta = theta + 2*pi;
end

[newR, newC] = upGrad(R,C,theta);

end

