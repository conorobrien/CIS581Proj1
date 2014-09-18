

%% 
addpath('train_images_P1');
I = imread('118035.jpg');
I = double(I);
I = .5*I(:,:,1) + .5*I(:,:,2);
% I = I(1:2:end, 1:2:end);

% I = myImcrop(I);

% I = triu(ones(10,10))*50;
% I = [ones(10,5)*50, zeros(10,5)]';

% I = [ones(5,5)*20, zeros(5,5);  zeros(5,5),  zeros(5,5)];
figure(1); clf; imagesc(I); axis image; colormap gray;

E = cannyEdge(I);
figure(2); clf; imagesc(E); axis image; colormap gray;

%%
% %% create an image 
% % size: 6 x 10, image I with boundaries for proper convolution operation
% A = [ones(1,10); [ones(1,9),zeros(1,1)]; [ones(1,7),zeros(1,3)];...
%     [ones(1,5),zeros(1,5)]; [ones(1,3),zeros(1,7)];[ones(1,1),zeros(1,9)]];
% 
% %% smoothing kernel
% smoothk = [0.25, 0.5, 0.25];
% 
% %% image I is the center portion of the image A, remove the boundary
% I = A(2:end-1,2:end-1); % trim 1 pixel border from edges
% 
% %% compute smoothed version of the image AA, low pass
% AA = conv2(A,smoothk,'same'); % smooth in x direction
% AA = conv2(AA,smoothk','same'); % smooth in y direction
% 
% J = AA(2:end-1,2:end-1);
% 
% figure(2);clf;imagesc(J);colormap(gray);axis image; title('J: smoothed image')
% 
% figure(3);
% clf;
% imagesc(J);
% colormap(gray);
% axis image; 
% hold on; 
% quiver(Jx,Jy); 
% quiver(-Jy,Jx,'r'); 
% quiver(Jy,-Jx,'r');
% 
% cannyEdge(J)
