function edge = cannyEdge(I)

I = double(I);

if size(I, 3) > 1
    I = .5*I(:,:,1) + .5*I(:,:,2);
end

edge_following = true;
% find gradient of I using derivative of a gaussian
[Jx, Jy] = computeImageGradients(I);
disp('Calculated Gradients')
% Find magnitude and direction of gradient
J = sqrt(Jx.*Jx + Jy.*Jy);
theta = -1*atan2(Jy, Jx);
% define high and low thresholds for edge detection (arbitrary for now)
% T_high = 10;
% T_low = 5;

[nelements, value] = hist(J(:), max(J(:)));

for i = 1:max(value)
    percent = sum(nelements(end-i:end))/length(J(:));
    if percent > 0.12
        T_high = value(end-i);
        break
    end
end

T_low = 0.25*T_high;

disp([T_high T_low])

% zero-pad both J and theta
J = padarray(J, [1 1]);
theta = padarray(theta, [1 1]);

% Automatically mark everything below low threshold as visited
visited = zeros(size(J));
visited(J < T_low) = 1;
following_gradient = false;
edge = false(size(J));
direction = 0;

disp('starting search')
disp(sum(sum((J.*~visited) > T_high)));
while sum(sum((J.*~visited) > T_high))
    %         disp(sum(sum((J.*~visited) > T_high)));
    
    if ~following_gradient || visited(R,C)
        % Find starting pixel for search, change to max later
        [R, C] = find((J.*~visited)>T_high, 1, 'first');
        direction = 0;
        following_gradient = false;
    end
    
    current = J(R,C);
    visited(R,C) = 1;
    
    [ahead, behind] = getGradientNeighbors(J(R-1:R+1, C-1:C+1), theta(R,C));
    
    % not starting up gradient yet
    if current < behind + 0.0001
        following_gradient = false;
        direction = 0;
        continue
        % following gradient
    elseif current <= ahead - 0.0001
        following_gradient = true;
        [R,C] = upGrad(R,C,theta(R,C));
        if edge_following
            if direction == 2
                direction = 0;
            elseif direction == 1;
                direction = 2;
                [R,C] = perpGrad(R,C,theta(Redge,Cedge), 'left');
            end
        end
        % found edge
    elseif current > ahead - 0.0001
        edge(R,C) = true;
        if edge_following
            following_gradient = true;
            direction = 1;
            Redge = R;
            Cedge = C;
            if direction == 1
                [R,C] = perpGrad(R,C,theta(R,C), 'right');
            elseif direction == 2
                [R,C] = perpGrad(R,C,theta(R,C), 'left');
            end
        else
            following_gradient = false;
        end
        
        % enter edge following mode
        
    else
        continue
    end
    
    
end
edge = edge(2:end-1,2:end-1);
end