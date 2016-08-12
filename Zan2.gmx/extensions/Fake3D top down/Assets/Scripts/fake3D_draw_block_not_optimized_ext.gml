/// fake3D_draw_block_not_optimized_ext(x,y,top_sprite, top_index, sidedown_sprite, sidedown_index, sideleft_sprite, sideleft_index, sideright_sprite,sideright_index, sideup_sprite,sideup_index, height, alpha);

var _x, _y, _topsprite, _sidesprite, _height, _alpha;

_x                  = argument[0];
_y                  = argument[1];
_topsprite          = argument[2];
_topindex           = argument[3];
_sidedownsprite     = argument[4];
_sidedownindex      = argument[5];
_sideleftsprite     = argument[6];
_sideleftindex      = argument[7];
_siderightsprite    = argument[8];
_siderightindex     = argument[9];
_sideupsprite       = argument[10];
_sideupindex        = argument[11];
_height             = argument[12];
_alpha              = argument[13];

_alphapre           = draw_get_alpha();

_topspritewidth     = sprite_get_width(_topsprite);
_topspriteheight    = sprite_get_height(_topsprite);

lp = 1;

    var dir     = point_direction(_x+(_topspritewidth/2),_y+(_topspriteheight/2),fake3D_get_perspective_x(),fake3D_get_perspective_y());  
    var length1  = point_distance(_x,_y,fake3D_get_perspective_x(),fake3D_get_perspective_y());
    var dir1     = point_direction(_x,_y,fake3D_get_perspective_x(),fake3D_get_perspective_y());
    
    var length2  = point_distance(_x+_topspritewidth,_y,fake3D_get_perspective_x(),fake3D_get_perspective_y());
    var dir2     = point_direction(_x+_topspritewidth,_y,fake3D_get_perspective_x(),fake3D_get_perspective_y());
    
    var length3  = point_distance(_x+_topspritewidth,_y+_topspriteheight,fake3D_get_perspective_x(),fake3D_get_perspective_y());
    var dir3     = point_direction(_x+_topspritewidth,_y+_topspriteheight,fake3D_get_perspective_x(),fake3D_get_perspective_y());
    
    var length4  = point_distance(_x,_y+_topspriteheight,fake3D_get_perspective_x(),fake3D_get_perspective_y());
    var dir4     = point_direction(_x,_y+_topspriteheight,fake3D_get_perspective_x(),fake3D_get_perspective_y());
    
    var realheight1 = (length1/global.perspective_strength)*_height;
    var realheight2 = (length2/global.perspective_strength)*_height;
    var realheight3 = (length3/global.perspective_strength)*_height;
    var realheight4 = (length4/global.perspective_strength)*_height;
    
    var ld_x1 = lengthdir_x(realheight1,dir1-180);
    var ld_y1 = lengthdir_y(realheight1,dir1-180);
    
    var ld_x2 = lengthdir_x(realheight2,dir2-180);
    var ld_y2 = lengthdir_y(realheight2,dir2-180);
    
    var ld_x3 = lengthdir_x(realheight3,dir3-180);
    var ld_y3 = lengthdir_y(realheight3,dir3-180);
    
    var ld_x4 = lengthdir_x(realheight4,dir4-180);
    var ld_y4 = lengthdir_y(realheight4,dir4-180);

if (_sidesprite != noone){
    //Up Side
    if (dir > 0 && dir < 180){
        draw_sprite_pos(_sideupsprite, _sideupindex,_x+ld_x1, _y+ld_y1,_x+ld_x2+_topspritewidth, _y+ld_y2,_x+_topspritewidth, _y,_x, _y,_alpha);
    }
    
    //Right Side
    if (dir < 90 || dir > 270){
        draw_sprite_pos(_siderightsprite, _siderightindex,_x+ld_x2+_topspritewidth, _y+ld_y2,_x+ld_x3+_topspritewidth, _y+ld_y3+(_topspriteheight),_x+_topspritewidth, _y+_topspriteheight,_x+_topspritewidth, _y,_alpha);
    }
    
    //Left Side
    if (dir > 90 && dir < 270){
        draw_sprite_pos(_sideleftsprite, _sideleftindex,_x+ld_x1, _y+ld_y1,_x+ld_x4, _y+ld_y4+(_topspriteheight),_x, _y+_topspriteheight,_x, _y,_alpha);
    }
    
    //Down Side
    if (dir > 0 && dir > 180){
        draw_sprite_pos(_sidedownsprite, _sidedownindex,_x+ld_x4, _y+ld_y4+(_topspriteheight),_x+ld_x3+(_topspritewidth), _y+ld_y3+(_topspriteheight),_x+_topspritewidth, _y+_topspriteheight,_x, _y+_topspriteheight,_alpha);
    }
    
}

if (_topsprite != noone){
    //Drawing Top
        draw_sprite_pos(_topsprite, _topindex,_x+ld_x1, _y+ld_y1,_x+_topspritewidth+ld_x2, _y+ld_y2,_x+_topspritewidth+ld_x3, _y+_topspriteheight+ld_y3,_x+ld_x4, _y+_topspriteheight+ld_y4,_alpha);
}