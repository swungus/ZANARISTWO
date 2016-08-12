/// fake3D_draw_block_update(x,y,top_sprite, top_index, side_sprite, side_index, height, alpha);

_x                  = argument[0];
_y                  = argument[1];
_topsprite          = argument[2];
_topindex           = argument[3];
_sidesprite         = argument[4];
_sideindex          = argument[5];
_height             = argument[6];
_alpha              = argument[7];

_alphapre           = draw_get_alpha();

_topspritewidth     = sprite_get_width(_topsprite);
_topspriteheight    = sprite_get_height(_topsprite);

    dir     = point_direction(_x+(_topspritewidth/2),_y+(_topspriteheight/2),fake3D_get_perspective_x(),fake3D_get_perspective_y());  
    length1  = point_distance(_x,_y,fake3D_get_perspective_x(),fake3D_get_perspective_y());
    dir1     = point_direction(_x,_y,fake3D_get_perspective_x(),fake3D_get_perspective_y());
    
    length2  = point_distance(_x+_topspritewidth,_y,fake3D_get_perspective_x(),fake3D_get_perspective_y());
    dir2     = point_direction(_x+_topspritewidth,_y,fake3D_get_perspective_x(),fake3D_get_perspective_y());
    
    length3  = point_distance(_x+_topspritewidth,_y+_topspriteheight,fake3D_get_perspective_x(),fake3D_get_perspective_y());
    dir3     = point_direction(_x+_topspritewidth,_y+_topspriteheight,fake3D_get_perspective_x(),fake3D_get_perspective_y());
    
    length4  = point_distance(_x,_y+_topspriteheight,fake3D_get_perspective_x(),fake3D_get_perspective_y());
    dir4     = point_direction(_x,_y+_topspriteheight,fake3D_get_perspective_x(),fake3D_get_perspective_y());
    
    realheight1 = (length1/global.perspective_strength)*_height;
    realheight2 = (length2/global.perspective_strength)*_height;
    realheight3 = (length3/global.perspective_strength)*_height;
    realheight4 = (length4/global.perspective_strength)*_height;
    
    ld_x1 = lengthdir_x(realheight1,dir1-180);
    ld_y1 = lengthdir_y(realheight1,dir1-180);
    
    ld_x2 = lengthdir_x(realheight2,dir2-180);
    ld_y2 = lengthdir_y(realheight2,dir2-180);
    
    ld_x3 = lengthdir_x(realheight3,dir3-180);
    ld_y3 = lengthdir_y(realheight3,dir3-180);
    
    ld_x4 = lengthdir_x(realheight4,dir4-180);
    ld_y4 = lengthdir_y(realheight4,dir4-180);