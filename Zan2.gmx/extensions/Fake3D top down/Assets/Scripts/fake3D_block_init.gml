/// fake3D_block_init(width,height)

var width = argument[0];
var height = argument[1];

free_right = (instance_position(x+width/2+width/2, y+(height/2),object_index) = noone)
free_left  = (instance_position(x-width/2, y+(height/2),object_index) = noone)
free_up    = (instance_position(x+width/2, y-(height/2),object_index) = noone)
free_down  = (instance_position(x+width/2, y+height+(height/2),object_index) = noone) 