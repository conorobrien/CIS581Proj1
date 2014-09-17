function [ neighborsRelativeIndices, neighborsAngleRange ] = ...
    getGradientNeighbors( angle )
%UNTITLED3 Summary of this function goes here
%   Detailed explanation goes here

neighborsRelativeIndices = [0, 0; 0, 0];
neighborsAngleRange = [0, 0];

if (angle >= 0 && angle <= 45)
    neighborsRelativeIndices = [0, 1; -1, 1];
    neighborsAngleRange = [0; 45];
elseif (angle > 45 && angle <= 90)
    neighborsRelativeIndices = [-1, 1; -1, 0;];
    neighborsAngleRange = [45; 90];
elseif (angle > 90 && angle <= 135)
    neighborsRelativeIndices = [-1, 0; -1, -1];
    neighborsAngleRange = [90; 135];
elseif (angle > 135 && angle <= 180)
    neighborsRelativeIndices = [-1, -1; 0, -1];
    neighborsAngleRange = [135; 180];
elseif (angle > 180 && angle <= 225)
    neighborsRelativeIndices = [0, -1; 1, -1];
    neighborsAngleRange = [180; 225];
elseif (angle > 225 && angle <= 270)
    neighborsRelativeIndices = [1, -1; 1, 0];
    neighborsAngleRange = [225; 270];
elseif (angle > 270 && angle <= 315)
    neighborsRelativeIndices = [1, 0; 1, 1];
    neighborsAngleRange = [270; 315];
elseif (angle > 315 && angle <= 360)
    neighborsRelativeIndices = [1, 1; 0, 1];
    neighborsAngleRange = [315; 360];
end

end

