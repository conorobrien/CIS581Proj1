function [ paddedImage ] = addMirrorPadding( image, horizontalPaddingWidth,...
    verticalPaddingWidth )
%[PADDEDIMAGE] = ADDMIRRORPADDING(IMAGE, HORIZONTALPADDINGWIDTH,
% VERTICALPADDINGWIDTH) Adds padding to IMAGE by reflecting a border of
% HORIZONTALPADDINGWIDTH left and right and a border of
% VERTICALPADDINGWIDTH top and bottom.

paddedImage = addVerticalPadding(addHorizontalPadding(image,...
    horizontalPaddingWidth), verticalPaddingWidth);

end

