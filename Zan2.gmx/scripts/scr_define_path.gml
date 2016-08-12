///scr_define_path(sx,sy,fx,fy)
sx=argument0
sy=argument1
fx=argument2
fy=argument3
if !mp_grid_path(global.aigrid, path,sx,sy,fx,fy,true)
{
show_message("No Path!")
return false;
}
else 
{
path_set_kind(path,1)
path_set_precision(path,8)
return true;
}
