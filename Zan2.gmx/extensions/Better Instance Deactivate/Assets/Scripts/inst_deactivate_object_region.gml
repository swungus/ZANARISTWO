/// inst_deactivate_object_region(left, top, width, height, inside, obj)
var _x, _y, _width, _height, _inside, _inst;

_x = argument0;
_y = argument1;
_width = argument2;
_height = argument3;
_inside = argument4;
_inst = argument5;


if (!instance_exists(_inst)){
    exit;
}

if !ds_map_exists(ds_list_inst, object_get_name(_inst)){
    ds_list_inst[? object_get_name(_inst)] = ds_list_create();
}
var ox, oy;
while(true){
    if (_inside){
        i = collision_rectangle(_x, _y, _x+_width, _y+_height, _inst, false, true);
    }else{
        i = collision_rectangle(-1000, -1000, room_width+1000, _y, _inst, false,true) 
        if (i = noone){
            i = collision_rectangle(-1000, _y, _x, _y+_height, _inst, false,true)
            if (i = noone){
                i = collision_rectangle(_x+_width, _y, room_width+1000, _y+_height, _inst, false,true);
                if (i = noone){
                    i = collision_rectangle(-1000, _y+_height, room_width+1000, room_height+1000, _inst, false,true); 
                }
            }
        } 
    }
    if i{
        ds_list_add(ds_list_inst[? object_get_name(i.object_index)],i.id);
        instance_deactivate_object(i);
    }else break;
}
