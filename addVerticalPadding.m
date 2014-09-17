function [ paddedImage ] = addVerticalPadding( image, paddingWidth )
%[PADDEDIMAGE] = ADDVERTICALPADDING(IMAGE, PADDINGWIDTH) Adds padding to 
% IMAGE by reflecting a border of PADDINGWIDTH top and bottom.

topPadding = image(2 + paddingWidth - 1 : - 1 : 2, :, :);
bottomPadding = image(end - 1 : - 1 : end - 1 - (paddingWidth - 1), :, :);
paddedImage = [topPadding; image; bottomPadding];

end

