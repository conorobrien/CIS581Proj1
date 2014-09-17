function [ xGrad, yGrad ] = computeImageGradients( I )
%UNTITLED3 Summary of this function goes here
%   Detailed explanation goes here

dx = [1, -1];
dy = [1; -1];

xGrad = conv2(I, dx, 'same');
yGrad = conv2(I, dy, 'same');

end

