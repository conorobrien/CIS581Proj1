% I = IMAGE

% VISITED = EVERTHING IN I BELOW T_LOW

% CURRENT = FIND 1ST NOT VISITED ABOVE T_HIGH HAVE TO MAKE SURE THAT 1ST POINT
% ISN'T ALREADY PAST THE MAX MAGNITUDE, NOT SURE HOW TO DO THAT 
% 
% MAYBE CHECK NEXT AND PAST TO PICK A DIRECTION, THEN FOLLOW TO MAX 
% 
% MIGHT ALSO HAVE TO BE CONSISTENT WHICH DIRECTION YOU APPROACH FROM TO GET
% CONSISTENT PICK AFTER REPEATED VALUES, IN WHICH CASE I GUESS JUST MARK IT AS
% VISITED AND TRY FOR ANOTHER POINT

% START SEARCHING FOR EDGE

% 	MARK CURRENT AS VISITED

% 	FIND PREV + NEXT ALONG GRADIENT

% 	IF CURRENT IS BIGGER THAN NEXT:
% 		MARK AS EDGE

% 		FIND NEXT STEP:
% 			NEXT_STEP = PERPINDICULAR TO GRADIENT
% 			IF NEXT_STEP HAS BEEN VISITED ALREADY OR IS LESS THAN T_LOW
% 				BREAK OUT OF LINE FOLLOWING, FIND A NEW POINT > T_HIGH
% 			ELSE:
% 				GO BACK TO SEARCHING FOR EDGE, EVALUATE NEW CURRENT


% 	IF CURRENT ISNT BIGGER:
% 		FIND NEXT STEP:
% 			NEXT STEP IS UP GRADIENT
% 			CURRENT = NEXT STEP
% 			GO BACK TO SEARCHING FOR EDGE, EVAL NEW CURRENT

% KEEP DOING THIS UNTIL THERE ARE NO MORE UNVISITED POINTS ABOVE T_HIGH