%% Test bringAngleWithinRange

angle0 = 0;
angleWithinRange0 = 0;
assert(isequal(angleWithinRange0, bringAngleWithinRange(angle0)));

angle1 = 90;
angleWithinRange1 = 90;
assert(isequal(angleWithinRange1, bringAngleWithinRange(angle1)));

angle2 = -90;
angleWithinRange2 = 270;
assert(isequal(angleWithinRange2, bringAngleWithinRange(angle2)));

%% Test getGradientNeighbors

angle = 0;
neighborsRelativeIndicesCheck = [0, 1; -1, 1];
neighborsAngleRangeCheck = [0; 45];
[neighborsRelativeIndices, neighborsAngleRange] = getGradientNeighbors(angle);
assert(isequal(neighborsRelativeIndicesCheck, neighborsRelativeIndices));
assert(isequal(neighborsAngleRangeCheck, neighborsAngleRange));

angle = 40;
neighborsRelativeIndicesCheck = [0, 1; -1, 1];
neighborsAngleRangeCheck = [0; 45];
[neighborsRelativeIndices, neighborsAngleRange] = getGradientNeighbors(angle);
assert(isequal(neighborsRelativeIndicesCheck, neighborsRelativeIndices));
assert(isequal(neighborsAngleRangeCheck, neighborsAngleRange));

angle = 80;
neighborsRelativeIndicesCheck = [-1, 1; -1, 0];
neighborsAngleRangeCheck = [45; 90];
[neighborsRelativeIndices, neighborsAngleRange] = getGradientNeighbors(angle);
assert(isequal(neighborsRelativeIndicesCheck, neighborsRelativeIndices));
assert(isequal(neighborsAngleRangeCheck, neighborsAngleRange));

angle = 110;
neighborsRelativeIndicesCheck = [-1, 0; -1, -1];
neighborsAngleRangeCheck = [90; 135];
[neighborsRelativeIndices, neighborsAngleRange] = getGradientNeighbors(angle);
assert(isequal(neighborsRelativeIndicesCheck, neighborsRelativeIndices));
assert(isequal(neighborsAngleRangeCheck, neighborsAngleRange));

angle = 140;
neighborsRelativeIndicesCheck = [-1, -1; 0, -1];
neighborsAngleRangeCheck = [135; 180];
[neighborsRelativeIndices, neighborsAngleRange] = getGradientNeighbors(angle);
assert(isequal(neighborsRelativeIndicesCheck, neighborsRelativeIndices));
assert(isequal(neighborsAngleRangeCheck, neighborsAngleRange));

angle = 200;
neighborsRelativeIndicesCheck = [0, -1; 1, -1];
neighborsAngleRangeCheck = [180; 225];
[neighborsRelativeIndices, neighborsAngleRange] = getGradientNeighbors(angle);
assert(isequal(neighborsRelativeIndicesCheck, neighborsRelativeIndices));
assert(isequal(neighborsAngleRangeCheck, neighborsAngleRange));

angle = 230;
neighborsRelativeIndicesCheck = [1, -1; 1, 0];
neighborsAngleRangeCheck = [225; 270];
[neighborsRelativeIndices, neighborsAngleRange] = getGradientNeighbors(angle);
assert(isequal(neighborsRelativeIndicesCheck, neighborsRelativeIndices));
assert(isequal(neighborsAngleRangeCheck, neighborsAngleRange));

angle = 300;
neighborsRelativeIndicesCheck = [1, 0; 1, 1];
neighborsAngleRangeCheck = [270; 315];
[neighborsRelativeIndices, neighborsAngleRange] = getGradientNeighbors(angle);
assert(isequal(neighborsRelativeIndicesCheck, neighborsRelativeIndices));
assert(isequal(neighborsAngleRangeCheck, neighborsAngleRange));

angle = 318;
neighborsRelativeIndicesCheck = [1, 1; 0, 1];
neighborsAngleRangeCheck = [315; 360];
[neighborsRelativeIndices, neighborsAngleRange] = getGradientNeighbors(angle);
assert(isequal(neighborsRelativeIndicesCheck, neighborsRelativeIndices));
assert(isequal(neighborsAngleRangeCheck, neighborsAngleRange));

neighborsValues = [1; 8];
neighborsAngleRange = [90; 135];
thisAngle = 112.5
interpolatedValueCheck = 4.5;
interpolatedValue = interpolateBetweenNeighbors(neighborsValues, neighborsAngleRange, thisAngle);
assert(isequal(interpolatedValueCheck, interpolateBetweenNeighbors));




