function [ paddedImage ] = addZeroPadding( image, horizontalPaddingWidth,...
    verticalPaddingWidth)
%[PADDEDIMAGE] = ADDZEROPADDING(IMAGE, HORIZONTALPADDINGWIDTH,
% VERTICALPADDINGWIDTH) Adds padding to IMAGE by adding zeros in a border
% of HORIZONTALPADDINGWIDTH left and right and a border of
% VERTICALPADDINGWIDTH top and bottom.

topBottomPadding = zeros(horizontalPaddingWidth, size(image, 2), size(image, 3));
paddedImage = [topBottomPadding; image; topBottomPadding];
leftRightPadding = zeros(size(paddedImage, 1), verticalPaddingWidth, size(image, 3));
paddedImage = [leftRightPadding, paddedImage, leftRightPadding];

end

