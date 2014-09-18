function [ Jx, Jy ] = computeImageGradients( I )
%UNTITLED3 Summary of this function goes here
%   Detailed explanation goes here

paddedI = addMirrorPadding(I, 2, 2);

G = fspecial('gaussian', 5);
[dx, dy] = gradient(G);

Jx = conv2(paddedI, dx, 'valid');
Jy = conv2(paddedI, dy, 'valid');

% Jx(:,1) = 0;
% Jy(1,:) = 0;
end

