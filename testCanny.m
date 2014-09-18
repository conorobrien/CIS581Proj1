
addpath('train_images_P1');
I = imread('118035.jpg');
% I = I(1:2:end, 1:2:end); %downsample image
% I = myImcrop(I); %crop image
% I = triu(ones(10,10))*50; %toy diagonal edge
% I = [ones(10,5)*50, zeros(10,5)]'; %toy horizontal edge
% I = [ones(5,5)*20, zeros(5,5);  zeros(5,5),  zeros(5,5)]; %toy corner

figure(1); clf; imagesc(I); axis image; colormap gray;
tic
E = cannyEdge(I);
toc
figure(2); clf; imagesc(E); axis image; colormap gray;