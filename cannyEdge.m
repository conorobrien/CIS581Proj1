function edge = cannyEdge(I)
    
    
    % find gradient of I using derivative of a gaussian
	[Jx, Jy] = computeImageGradients(I);
    disp('Calculated Gradients')
    % Find magnitude and direction of gradient
    J = sqrt(Jx.*Jx + Jy.*Jy);
    theta = -1*atan2(Jy, Jx);
    
    
    % zero-pad both J and theta
    J = padarray(J, [1 1]);
    Jx = padarray(Jx, [1 1]);
    Jy = padarray(Jy, [1 1]);

    theta = padarray(theta, [1 1]);
    
%     imagesc(padarray(I, [1 1]))
%     hold on
%     axis image
%     quiver(Jx, Jy);
    % define high and low thresholds for edge detection (arbitrary for now)
    T_high = 25;
    T_low = 10;

    % Automatically mark everything below low threshold as visited
    visited = zeros(size(J));
    visited(J < T_low) = 1;
    following_gradient = false;
    edge = false(size(J));
    
    disp('starting search')
    while sum(sum((J.*~visited) > T_high))
%         disp(sum(sum((J.*~visited) > T_high)));
        
    	if ~following_gradient
			% Find starting pixel for search, change to max later
	    	[R, C] = find((J.*~visited)>T_high, 1, 'first');
	    end

    	current = J(R,C);
    	visited(R,C) = 1;

    	[ahead, behind] = getGradientNeighbors(J(R-1:R+1, C-1:C+1), theta(R,C));

        % not starting up gradient yet
    	if current < behind + 0.0001
    		following_gradient = false;
    		continue
        % following gradient
        elseif current <= ahead - 0.0001
    		following_gradient = true;
    		[R,C] = upGrad(R,C,theta(R,C));
            if visited(R,C)
                following_gradient = false;
            end
        % found edge
        elseif current > ahead - 0.0001
            edge(R,C) = true;
            following_gradient = true;
    		[R,C] = perpGrad(R,C,theta(R,C), 'left');
            if visited(R,C)
                following_gradient = false;
            end
            % enter edge following mode

        else
            continue
        end
        
        
    end
    edge = edge(2:end-1,2:end-1); 
end
   %  		% You've found an edge
   %  		edge(R,C) = true;
   %  		following_gradient = true;

   %  		Redge = R;
   %  		Cedge = C;

   %  		% need to come back to found edge and go the other drection
   %  		% don't know how
   %  		% next step is going to be perpindicular to current positions
			% [R, C] = perpNeighbor(R,C,theta(R,C), 'left');
