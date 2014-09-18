function edge = cannyEdge(I)

% conv2 gives a warning if I isn't a single or double, just convert
% everything to double to suppress it
I = double(I);

% If I is a RGB image, average the red and green to get intensity matrix
if size(I, 3) > 1
    I = .5*I(:,:,1) + .5*I(:,:,2);
end

% This is a bool to turn off edge following, just lets us compare edge
% following vs not edge following
edge_following = true;

% find gradient of I using derivative of a gaussian
[Jx, Jy] = computeImageGradients(I);
disp('finished calculating gradients...')

% Find magnitude and direction of the gradient
J = sqrt(Jx.*Jx + Jy.*Jy);
theta = -1*atan2(Jy, Jx);

% define high and low thresholds for edge detection, use hist to get
% frequency of values, then pick the top 12% of values to get the high
% threshold

[nelements, value] = hist(J(:), max(J(:)));

for i = 1:max(value)
    percent = sum(nelements(end-i:end))/length(J(:));
    if percent > 0.12
        T_high = value(end-i);
        break
    end
end

T_low = 0.25*T_high;

disp('thresholds...')
disp([T_high T_low])

% zero-pad both J and theta to avoid edge collisions during gradient
% following
J = padarray(J, [1 1]);
theta = padarray(theta, [1 1]);

% Automatically mark everything below low threshold as visited so we don't
% look at it
visited = zeros(size(J));
visited(J < T_low) = 1;

% set state variables
following_gradient = false; %if false find new starting point, if true keep following gradient or edge
direction = 0; % 0 = not following edge, 1 = go right, 2 = go left

edge = false(size(J));

disp('starting search...')
% this is the number of points above the high threshold that we have to
% check
disp(sum(sum((J.*~visited) > T_high)));

%while there are still unvisited points above high threshold keep searching
%this takes up to about 30 seconds on my computer (macbook air). It doesn't
%infinite loop though!
while sum(sum((J.*~visited) > T_high))
    
    if ~following_gradient || visited(R,C)
        % Find starting pixel for search, reset status variables
        [R, C] = find((J.*~visited)>T_high, 1, 'first');
        direction = 0;
        following_gradient = false;
    end
    
    current = J(R,C);
    visited(R,C) = 1;
    
    %Returns interpolated points along and against gradient
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
            % if following edge, either go back to initial point and flip
            % direction, or stop following edge and get a new point
            if direction == 2
                direction = 0;
            elseif direction == 1;
                direction = 2;
                [R,C] = perpGrad(R,C,theta(Redge,Cedge), 'left');
            end
        end
    % found edge!
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
    else
        continue
    end
    
    
end
%cut off zero pad from edge
edge = edge(2:end-1,2:end-1);
end