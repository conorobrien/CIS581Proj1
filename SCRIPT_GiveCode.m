%% Given Code

%% create an image 
% size: 6 x 10, image I with boundaries for proper convolution operation
A = [ones(1,10); [ones(1,9),zeros(1,1)]; [ones(1,7),zeros(1,3)];...
    [ones(1,5),zeros(1,5)]; [ones(1,3),zeros(1,7)];[ones(1,1),zeros(1,9)]];

%% smoothing kernel
smoothk = [0.25, 0.5, 0.25];

%% image I is the center portion of the image A, remove the boundary
I = A(2:end-1,2:end-1); % trim 1 pixel border from edges

%% compute smoothed version of the image AA, low pass
AA = conv2(A,smoothk,'same'); % smooth in x direction
AA = conv2(AA,smoothk','same'); % smooth in y direction

%% take out the center portion of the smoothed image AA,
J = AA(2:end-1,2:end-1); % trim 1 pixel border from edges

%% compare the two images
figure(1);clf;imagesc(I);colormap(gray);axis image; title('I: A with border trimmed')
figure(2);clf;imagesc(J);colormap(gray);axis image; title('J: smoothed image')

%% define image gradient operator 
dy = [1;-1]; % gradient filter in y
dx = [1,-1]; % gradient filter in x

%% compute image gradient in x and y
AA_y = conv2(AA,dy,'same'); 
AA_x = conv2(AA,dx,'same'); 
Jy = AA_y(1:end-2,2:end-1); 
Jy(1,:) = 0; 
Jx = AA_x(2:end-1,1:end-2); 
Jx(:,1) = 0; 

%% display the image gradient flow 
figure(3);
clf;
imagesc(J);
colormap(gray);
axis image; 
hold on; 
quiver(Jx,Jy); 
quiver(-Jy,Jx,'r'); 
quiver(Jy,-Jx,'r');







