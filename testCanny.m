

%% 
addpath('train_images_P1');
I = imread('302008.jpg');
% I = I(1:2:end, 1:2:end);

% I = myImcrop(I);

% I = triu(ones(10,10))*50;
% I = [ones(10,5)*50, zeros(10,5)]';

% I = [ones(5,5)*20, zeros(5,5);  zeros(5,5),  zeros(5,5)];
figure(1); clf; imagesc(I); axis image; colormap gray;

E = cannyEdge(I);
figure(2); clf; imagesc(E); axis image; colormap gray;