//create a temp list and add alert nodes within vision to it...
var a_list;
a_list=ds_list_create();

with (obj_alert_node)
{
if id!=other.a_visited
    {
    if collision_circle(other.x,other.y,other.v,id,false,false)
        {
        if !collision_line(x,y,other.x,other.y,obj_wall,true,false)
            {
            if ds_list_find_index(other.v_list,id)=-1 ds_list_add(a_list,id);
            }
        }
    }
}

//If list is not empty, randomise it and select the first node...
if !ds_list_empty(a_list)
{
ds_list_shuffle(a_list);
//DEBUG START---------------Can be deleted
var i;
for (i=0; i<ds_list_size(a_list); i+=1;)
    {
    with (ds_list_find_value(a_list,i))
        {
        visible=true;
        alarm[0]=room_speed;
        }
    }
//DEBUG END------------------------------
a_node=ds_list_find_value(a_list,0);
ds_list_add(v_list,a_node);
ds_list_destroy(a_list);
scr_Path_Create(a_node.x,a_node.y);
}
else
{
//If list is empty go back to patrol state...
ds_list_destroy(a_list);
//show_message("list empty"); //debug... Can be deleted
state=1;
a_timer=6;
if p_num!=-1 scr_Path_Create(p[p_num,0],p[p_num,1]);
else
    {
    ds_list_clear(v_list);
    a_node=noone;
    a_timer=1;
    state=0;
    }
}
