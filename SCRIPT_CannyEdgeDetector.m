%% Canny Edge Detector

clear;
% close all;
clc;

addpath('train_images_P1');

%% Step 1: Compute Image Gradient

% I = imread('118035.jpg');
I = imread('I1.jpg');
I = double(I);
% I = I(1:5:end, 1:5:end);
% I changed the image, this one is just b/w and has lots of different edges
% I = double(0.5*(I(:, :, 1) + I(:, :, 2)));
% paddedI = addMirrorPadding(I, 1, 1);

%Added a bit of smoothing before computing the gradient
% Is = conv2(I, ones(3), 'same');
[xGrad, yGrad] = computeImageGradients(I);

Jy = yGrad(1:end-2,2:end-1); 
Jy(1,:) = 0; 
Jx = xGrad(2:end-1,1:end-2); 
Jx(:,1) = 0;

J = sqrt(Jx.*Jx + Jy.*Jy); % image gradient magnitude.

% J = sqrt(xGrad.*xGrad + yGrad.*yGrad);

figure(1);
clf;
imagesc(I);
colormap('gray');
axis image;
title('Original Image');

figure(2);
clf;
imagesc(J);
colorbar;
axis image;
title('Image Gradient Magnitude');
colormap jet;

figure(3);
clf;
gradientDirection = mod(atan2(Jy, Jx), 2*pi);
gradientDirection(J<5) = -1;
gradientDirection(J>=5) = 10*gradientDirection(J>=5);
imagesc(gradientDirection);
colormap(jet); 
colorbar;
axis image;

figure(4);
clf;
threshold = 35;
Jbinary = J > threshold;
imagesc(Jbinary);
colormap(gray);
axis image;

[edges, t] = nonMaxSupression(Jx, Jy, 5);

figure(5)
clf;
imagesc(edges);
colormap(jet);
axis image;

% figure(3);
% clf;
% imagesc(paddedI);
% colormap(gray);
% axis image; 
% hold on; 
% quiver(Jx,Jy); 
% quiver(-Jy,Jx,'r'); 
% quiver(Jy,-Jx,'r');






