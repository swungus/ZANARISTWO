/// fake3D_set_autoblock(sprite);
var _sprite;
_sprite = argument[0];

var _index = 0;

_spritewidth = sprite_get_width(_sprite);
_spriteheight = sprite_get_height(_sprite);

var up = (instance_position(x+_spritewidth/2, y-(_spriteheight/2),object_index) != noone);
var right = (instance_position(x+_spritewidth/2+_spritewidth/2, y+(_spriteheight/2),object_index) != noone);
var left = (instance_position(x-_spritewidth/2, y+(_spriteheight/2),object_index) != noone);
var down = (instance_position(x+_spritewidth/2, y+_spriteheight+(_spriteheight/2),object_index) != noone);


if up && down && left && right{
    _index = 4;
}else if up && down && left && !right{
    _index = 5;
}else if up && down && !left && right{
    _index = 3;
}else if !up && down && left && right{
    _index = 1
}else if up && !down && left && right{
    _index = 7;
}else if !up && down && !left && right{
    _index = 0;
}else if !up && down && left && !right{
    _index = 2;
}else if up && !down && !left && right{
    _index = 6;
}else if up && !down && left && !right{
    _index = 8;
}else{
    _index = 4;
}

return _index;