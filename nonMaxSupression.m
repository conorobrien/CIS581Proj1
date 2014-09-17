function [edges, clear_thresh] = nonMaxSupression(Jx, Jy, thresh)

Jx = padarray(Jx, [1 1]);
Jy = padarray(Jy, [1 1]);

J = sqrt(Jx.*Jx + Jy.*Jy);
angles = atan2(Jy, Jx);

clear_thresh = J >= thresh;

edges = logical(false(size(Jx)));

for R = 2:size(J, 1)-1
    for C = 2:size(J,2)-1
    
        if J(R, C) < thresh
            continue
        end
        
        if localMax(J(R-1:R+1, C-1:C+1), angles(R,C))
        	edges(R,C) = true;
        else
            J(R,C) = 0;
        end
    end
end
