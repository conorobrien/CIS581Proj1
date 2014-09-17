function [ angleWithinRange ] = bringAngleWithinRange( angle )
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here

if (angle > 360)
    while (angle > 360)
        angle = angle - 360;
    end
elseif (angle < 0)
    while (angle < 0)
        angle = angle + 360;
    end
end

angleWithinRange = angle;

end

