/// fake3D_draw_block_side();

if (_sidesprite != noone){
    //Up Side
    if (dir > 0 && dir < 180) && free_up{
        draw_sprite_pos(_sidesprite, _sideindex,_x+ld_x1, _y+ld_y1,_x+ld_x2+_topspritewidth, _y+ld_y2,_x+_topspritewidth, _y,_x, _y,_alpha);
    }
    
    //Right Side
    if (dir < 90 || dir > 270) && free_right{
        draw_sprite_pos(_sidesprite, _sideindex,_x+ld_x2+_topspritewidth, _y+ld_y2,_x+ld_x3+_topspritewidth, _y+ld_y3+(_topspriteheight),_x+_topspritewidth, _y+_topspriteheight,_x+_topspritewidth, _y,_alpha);
    }
    
    //Left Side
    if (dir > 90 && dir < 270) && free_left{
        draw_sprite_pos(_sidesprite, _sideindex,_x+ld_x1, _y+ld_y1,_x+ld_x4, _y+ld_y4+(_topspriteheight),_x, _y+_topspriteheight,_x, _y,_alpha);
    }
    
    //Down Side
    if (dir > 0 && dir > 180) && free_down{
        draw_sprite_pos(_sidesprite, _sideindex,_x+ld_x4, _y+ld_y4+(_topspriteheight),_x+ld_x3+(_topspritewidth), _y+ld_y3+(_topspriteheight),_x+_topspritewidth, _y+_topspriteheight,_x, _y+_topspriteheight,_alpha);
    }
    
}