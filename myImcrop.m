function [ J ] = myImcrop( I )
%[J] = MYIMCROP(I) reads and displays an image I and displays and returns a
%user-defined cropped image J.

close all;

% reads in an image
% thisImage = imread(I);
thisImage = I;

% displays the image in figure 1
figure(1);
image(thisImage);
axis equal;
colormap gray;
title('Original Image');

% prompts the user to crop out a sub-image
% fprintf('Click the \n1) top left corner \n2) the bottom right corner \nof the subimage you would like to crop.');
[x, y] = ginput(2);

x = round(x);
y = round(y);

% displays and returns the sub-image

subImage = thisImage(min(y) : max(y), min(x) : max(x), :);
% 
% figure(2);
% image(subImage);
% axis equal;
% title('Cropped Image');
close(1)
J = subImage;

end

