CONTROL = ctr

//Script by Yourself
//argument 0,1,2 xyz of CONTROL argument 3,4,5 xyz of target argument 6 aspect ratio!
var pX,pY,pZ,mm;

// get the desired point's coordinates relative to the CONTROL 
pX = argument3-argument0;
pY = argument4-argument1;
pZ = argument5-argument2;

// scale this vector so that it's head lies somewhere 
// on an imaginary plane in front of the CONTROL (your screen)
mm = pX*CONTROL.dX+pY*CONTROL.dY+pZ*CONTROL.dZ;

if (mm > 0)
{
pX /= mm;
pY /= mm;
pZ /= mm;
}
else {global.__x=0;global.__y=-100;exit}

mm = (pX*CONTROL.vX+pY*CONTROL.vY+pZ*CONTROL.vZ)/sqr(argument6*CONTROL.tFOV);
global.__x = (mm+1)/2*view_wview[0]//window_get_width();//room_width
mm = (pX*CONTROL.uX+pY*CONTROL.uY+pZ*CONTROL.uZ)/sqr(CONTROL.tFOV);
global.__y = (1-mm)/2*view_hview[0]//window_get_height();//room_width
