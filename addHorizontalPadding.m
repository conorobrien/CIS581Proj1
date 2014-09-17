function [ paddedImage ] = addHorizontalPadding( image, paddingWidth )
%[PADDEDIMAGE] = ADDHORIZONTALPADDING(IMAGE, PADDINGWIDTH) Adds padding to 
% IMAGE by reflecting a border of PADDINGWIDTH left and right.

leftPadding = image(:, 2 + paddingWidth - 1 : - 1 : 2, :);
rightPadding = image(:, end - 1 : - 1 : end - 1 - (paddingWidth - 1), :);
paddedImage = [leftPadding, image, rightPadding];

end