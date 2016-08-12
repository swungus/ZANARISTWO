/// inst_deactivate_object_all(obj)
var _inst;
_inst = all;

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

