/// inst_activate_object_all
var _inst;
_inst = all;

var inst_list;

for(i=0; i<ds_list_size(ds_list_inst[? object_get_name(_inst)]); i+=1){
    inst_list = ds_list_find_value(ds_list_inst[? object_get_name(_inst)], i);
    instance_activate_object(inst_list);
    ds_list_delete(ds_list_inst[? object_get_name(_inst)], i);
}
