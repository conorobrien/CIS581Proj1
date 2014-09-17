function [ xGrad, yGrad ] = computeImageGradients( I )
%UNTITLED3 Summary of this function goes here
%   Detailed explanation goes here

G = fspecial('gaussian', 3);
[dx, dy] = gradient(G);

xGrad = conv2(I, dx, 'same');
yGrad = conv2(I, dy, 'same');

end

