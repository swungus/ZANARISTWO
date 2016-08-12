//This creates the path for the AI and culls points to make it more natural...
//argument0=x coord
//argument1=y coord

//This rounds the points when not alerted to keep the AI within the grid

if state!=2
{ if p_num!=-1
    {
    argument0=floor(argument0/16)*16+8;
    argument1=floor(argument1/16)*16+8;
    }
}


//Check and see if path exists
if !mp_grid_path(global.AI_grid,mypath,x,y,argument0,argument1,true)
{
//If no path found go to No Path Move (state 0) for a time...
state=0;
alarm[0]=room_speed*3;
len=0;
np_dir=choose(-10,10);
}
else
{
path_end();
//if path is valid create it and cull unnecessary points...
mp_grid_path(global.AI_grid,mypath,x,y,argument0,argument1,true);
path_set_kind(mypath,1);
path_set_precision(mypath,8);
var n,x1,y1,x2,y2,x3,y3;
if path_get_number(mypath)>2
    {
    for (n=1; n<path_get_number(mypath); n+=1)
        {
        x1=path_get_point_x(mypath,n-1)
        y1=path_get_point_y(mypath,n-1)
        x2=path_get_point_x(mypath,n)
        y2=path_get_point_y(mypath,n)
        x3=path_get_point_x(mypath,n+1)
        y3=path_get_point_y(mypath,n+1)
        if (x2-x1)*(y3-y2)=(x3-x2)*(y2-y1) 
            {
            path_delete_point(mypath,n)
            n-=1
            }
        }
    }
//get length of the path and number of points on the path
//then set the moving x/y coords for mp_potential step
//to the first point (or the end of the path if there are no points).
len=path_get_number(mypath);
if len<=1
    {
    xx=argument0;
    yy=argument1;
    }
else
    {
    pos=0;
    xx=path_get_point_x(mypath,pos);
    yy=path_get_point_y(mypath,pos);
    }
}
