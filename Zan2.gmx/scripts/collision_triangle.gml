/* This script combines the parameters of GM's draw_triangle()
and the collision checking functions. It returns the id of one of
the instances that collide with the triangular region.
*/
var x1,y1,x2,y2,x3,y3,obj,prec,notme,i,short,xx,yy,ind,side1,side2,side3;
x1=argument0; x2=argument2; x3=argument4;
y1=argument1; y2=argument3; y3=argument5;
obj=argument6; prec=argument7; notme=argument8;

side1=point_distance(x1,y1,x2,y2);
side2=point_distance(x2,y2,x3,y3);
side3=point_distance(x1,y1,x3,y3);
short=min(side1,side2,side3);

if(short==side1)
{
for(i=0;i<=side1;i+=1)
    {
    xx=x1+lengthdir_x(i,point_direction(x1,y1,x2,y2));
    yy=y1+lengthdir_y(i,point_direction(x1,y1,x2,y2));
    ind=collision_line(x3,y3,xx,yy,obj,prec,notme);
    if(ind>0) break;
    } 
return ind;
}

if(short==side2)
{
for(i=0;i<=side2;i+=1)
    {
    xx=x2+lengthdir_x(i,point_direction(x2,y2,x3,y3));
    yy=y2+lengthdir_y(i,point_direction(x2,y2,x3,y3));
    ind=collision_line(x1,y1,xx,yy,obj,prec,notme);
    if(ind>0) break;
    }
return ind;
}

if(short==side3)
{
for(i=0;i<=side3;i+=1)
    {
    xx=x1+lengthdir_x(i,point_direction(x1,y1,x3,y3));
    yy=y1+lengthdir_y(i,point_direction(x1,y1,x3,y3));
    ind=collision_line(x1,y1,xx,yy,obj,prec,notme);
    if(ind>0) break;
    }
return ind;
}
