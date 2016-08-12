//Declare arguments
var x1, y1, x2, y2, obj, prec, notme;
return_object = 0;
x1 = argument0;
y1 = argument1;
x2 = argument2;
y2 = argument3;
obj = argument4;
prec = argument5;
notme = argument6;

//Declare internals
var dx, dy, instance, first_instance;

dx=0;
dy=0;

first_instance = collision_line(x1, y1, x2, y2, obj, prec, notme);

if(first_instance != noone)
{
dx = x2 - x1
dy = y2 - y1
while (abs(dx) >= 1 or abs(dy) >= 1)
    {
    dx /= 2;
    dy /= 2;
    instance = collision_line(x1, y1, x2-dx, y2-dy, obj, prec, notme);
    if(instance != noone)
        {
        first_instance=instance;
        x2 -= dx;
        y2 -= dy;
        }
    }
}

collision_x = x2-dx;
collision_y = y2-(dy*2);

return first_instance;
