//script by Yourself
//arguments 0-10 (first 11 arguments): Same as first 11 arguments of d3d_set_projection_ext().

var mm;
// Get a vector which represents the direction the camera is pointing and normalise it
dX = argument3-argument0;
dY = argument4-argument1;
dZ = argument5-argument2;
mm = sqrt(dX*dX+dY*dY+dZ*dZ);
dX /= mm;
dY /= mm;
dZ /= mm;
// Get the up vector from the arguments and orthogonalize it with the camera direction
// Orthogonalize is a fancy way of saying I'll make the vectors perpendicular
uX = argument6;
uY = argument7;
uZ = argument8;
mm = uX*dX+uY*dY+uZ*dZ;
uX -= mm*dX;
uY -= mm*dY;
uZ -= mm*dZ;
mm = sqrt(uX*uX+uY*uY+uZ*uZ);
uX /= mm;
uY /= mm;
uZ /= mm;
// Scale the vector up by the tangent of half the view angle
tFOV = tan(argument9*pi/360);
uX *= tFOV;
uY *= tFOV;
uZ *= tFOV;
// We need one more vector which is perpendicular to both the previous vectors
// So we use a cross product: v = u x d
vX = uY*dZ-dY*uZ;
vY = uZ*dX-dZ*uX;
vZ = uX*dY-dX*uY;
// This vector's magnitude is now the same as ||u||, so we scale it up by the aspect ratio
// This vector represents the 2D x-axis on your screen in 3D space
vX *= argument10;
vY *= argument10;
vZ *= argument10;
