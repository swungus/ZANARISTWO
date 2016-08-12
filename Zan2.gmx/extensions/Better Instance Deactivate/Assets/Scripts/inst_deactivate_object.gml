/// inst_deactivate_object(obj)
var _inst;
_inst = argument0;

if (!instance_exists(_inst)){
    exit;
}

if !ds_map_exists(ds_list_inst, object_get_name(_inst)){
    ds_list_inst[? object_get_name(_inst)] = ds_list_create();
}

for(i = 0; i < instance_number(_inst); i++){
    var inst;
    inst = instance_find(_inst, i);
    ds_list_add(ds_list_inst[? object_get_name(inst.object_index)],inst.id);
    instance_deactivate_object(i);
}

