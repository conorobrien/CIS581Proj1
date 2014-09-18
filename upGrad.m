function [ newR, newC ] = upGrad( R, C, theta )
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here

if (theta >= pi/8 && theta < 7*pi/8)
    newR = R - 1;    
elseif (theta >= -7*pi/8 && theta < -pi/8)
    newR = R + 1;
else
    newR = R;
end

if (theta >= 5*pi/8 || theta < -5*pi/8)
    newC = C - 1;    
elseif (theta >= -3*pi/8 && theta < 3*pi/8)
    newC = C + 1;
else
    newC = C;
end

end

