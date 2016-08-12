//instance_nth_nearest(x,y,obj,n)
/* this script returns the id of the "obj" instance that is "n" instances away
    from point ("x","y")
*/ 
pri=ds_priority_create();
with (argument2)
    {ds_priority_add(other.pri,id,distance_to_point(other.argument0,other.argument1));}
repeat (argument3-1)
    {ds_priority_delete_min(pri);}
q=ds_priority_find_min(pri);
ds_priority_destroy(pri);
return q;
