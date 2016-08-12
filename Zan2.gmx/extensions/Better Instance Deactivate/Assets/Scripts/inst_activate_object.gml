/// inst_activate_object(obj)
var _inst;
_inst = argument0;

var inst_list;

if !ds_exists(ds_list_inst[? object_get_name(_inst)], ds_type_list){
    exit;
}

for(i=0; i<ds_list_size(ds_list_inst[? object_get_name(_inst)]); i+=1){
    inst_list = ds_list_find_value(ds_list_inst[? object_get_name(_inst)], i);
    instance_activate_object(inst_list);
    ds_list_delete(ds_list_inst[? object_get_name(_inst)], i);
}
