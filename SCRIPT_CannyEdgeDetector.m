%% Canny Edge Detector

clear;
close all;
clc;

addpath('train_images_P1\');

%% Step 1: Compute Image Gradient

I = imread('118035.jpg');
I = double(0.5*(I(:, :, 1) + I(:, :, 2)));
paddedI = addMirrorPadding(I, 1, 1);

[xGrad, yGrad] = computeImageGradients(I);

Jy = yGrad(1:end-2,2:end-1); 
Jy(1,:) = 0; 
Jx = xGrad(2:end-1,1:end-2); 
Jx(:,1) = 0;

J = sqrt(Jx.*Jx + Jy.*Jy); % image gradient magnitude.

figure(1);
clf;
imagesc(paddedI);
colormap('gray');
axis image;
title('Original Image');

figure(2);
clf;
imagesc(J);
colorbar;
axis image;
title('Image Gradient Magnitude');
colormap gray;

figure(3);
clf;
gradientDirection = atan2(Jy, Jx);
imagesc(gradientDirection.*(J > 20));
colormap(hsv); 
colorbar;
axis image;

figure(4);
clf;
threshold = 35;
Jbinary = J > threshold;
imagesc(Jbinary);
colormap(gray);
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






