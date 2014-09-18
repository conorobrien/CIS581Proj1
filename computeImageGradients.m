function [ Jx, Jy ] = computeImageGradients( I )

paddedI = addMirrorPadding(I, 2, 2);

G = fspecial('gaussian', 5);
[dx, dy] = gradient(G);

Jx = conv2(paddedI, dx, 'valid');
Jy = conv2(paddedI, dy, 'valid');
end

