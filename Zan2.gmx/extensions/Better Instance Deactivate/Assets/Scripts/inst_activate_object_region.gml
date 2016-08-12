/// inst_activate_object_region(left, top, width, height, inside, obj)
var _x, _y, _width, _height, _inside, _inst;

_x = argument0;
_y = argument1;
_width = argument2;
_height = argument3+1;
_inside = argument4;
_inst = argument5;

var inst_list, inst_x, inst_y, inst_width, inst_height, ox, oy;

if !ds_exists(ds_list_inst[? object_get_name(_inst)], ds_type_list){
    exit;
}

for(i=0; i<ds_list_size(ds_list_inst[? object_get_name(_inst)]); i+=1){
    inst_list = ds_list_find_value(ds_list_inst[? object_get_name(_inst)], i);
    ox = sprite_get_xoffset(inst_list.sprite_index);
    oy = sprite_get_yoffset(inst_list.sprite_index);
    inst_x = inst_list.x-ox;
    inst_y = inst_list.y-oy;
    if (sprite_exists(inst_list.sprite_index)){
        inst_width = sprite_get_width(inst_list.sprite_index);
        inst_height = sprite_get_height(inst_list.sprite_index);
    }else{
        inst_width = 1;
        inst_height = 1;
    }
    if (!_inside){
        if rectangle_in_rectangle(inst_x, inst_y, inst_x+inst_width, inst_y+inst_height, _x, _y, _x+_width, _y+_height) = 0{
            instance_activate_object(inst_list);
            ds_list_delete(ds_list_inst[? object_get_name(_inst)], i);
        }
    }else{
        if rectangle_in_rectangle(inst_x, inst_y, inst_x+inst_width, inst_y+inst_height, _x, _y, _x+_width, _y+_height) = 1{
            instance_activate_object(inst_list);
            ds_list_delete(ds_list_inst[? object_get_name(_inst)], i);
        }
    }
}
