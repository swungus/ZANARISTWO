//Call:     inventory_draw(x,y,spr,alpha,backgroundcol)
//Info:     This will draw the inventory on the given x and y position. spr is
//          the sprite you want the inventory to have, you can write -1 if you
//          don't want a sprite (like I have done). Alpha is the alpha of the
//          inventory and backgroundcol is the background color of the inventory
//          (only if you don't use a sprite).
//Event:    Draw
//Returns:  ---

var xx,yy,spr,alpha,bgcol;
xx=argument0
yy=argument1
spr=argument2
alpha=argument3
bgcol=argument4

draw_set_alpha(alpha)

//Draw sprite or inventory
if (sprite_exists(spr)) {
    draw_sprite_stretched(spr,-1,xx,yy,(xx+138)-xx,(yy+240)-yy)
} else {
    draw_set_color(bgcol)
    draw_rectangle(xx,yy,xx+138,yy+240,0)

    draw_set_alpha(1)
    draw_set_color(c_black)
    draw_rectangle(xx,yy,xx+138,yy+240,1)
}
draw_set_alpha(1)
draw_set_color(c_black)

var a,b,no;
a=0
b=0
no=1
if (global.inv_optionshow=0) {
    global.inv_select=0
}
repeat (7) {
    repeat (4) {
        var spr,index;
        spr=sItems
        index=global.inv_item[no,0]
       // if (item_stackable(global.inv_item[no,0])=1) {spr=item_sprite(global.inv_item[no,0]); index=item_index(global.inv_item[no,1])}
        draw_rectangle(xx+2+(34*a),yy+2+(34*b),xx+2+(34*a)+32,yy+2+(34*b)+32,1)
        if ((global.inv_holditemno=no)=0) {
            draw_sprite(spr,index,xx+2+(34*a)+16,yy+2+(34*b)+16)
            if (item_stackable(global.inv_item[no,0])=1) {
                draw_set_font(fnt002)
                draw_set_color(c_black)
                draw_text(xx+1+(34*a)+2,yy+1+(34*b)+2,value_str(global.inv_item[no,1]))
                draw_set_color(c_yellow)
                draw_text(xx+1+(34*a)+1,yy+1+(34*b)+1,value_str(global.inv_item[no,1]))
                draw_set_color(c_black)
            }
        }
        if (mouse_x>=xx+(34*a) && mouse_x<=xx+(34*a)+34 && mouse_y>=yy+(34*b) && mouse_y<=yy+(34*b)+34 && global.inv_optionshow=0) {global.inv_select=no}
        a+=1
        no+=1
    }
    a=0
    b+=1
}
//draw head slot 31
        var spr,index;
        spr=sItems
        index=global.inv_item[31,0]
        draw_rectangle(96,160,128,192,1)
        if ((global.inv_holditemno=31)=0) {
            draw_sprite(spr,index,96+16,160+16)
           }
         if (mouse_x>=96 && mouse_x<=128 && mouse_y>=160 && mouse_y<=192&& global.inv_optionshow=0) {global.inv_select=31}
 //draw torso slot 32
        var spr,index;
        spr=sItems
        index=global.inv_item[32,0]
        draw_rectangle(96,192,128,224,1)
        if ((global.inv_holditemno=32)=0) {
            draw_sprite(spr,index,96+16,192+16)
           }
         if (mouse_x>=96 && mouse_x<=128 && mouse_y>=192 && mouse_y<=224&& global.inv_optionshow=0) {global.inv_select=32}
 //draw legs slot 33
        var spr,index;
        spr=sItems
        index=global.inv_item[33,0]
        draw_rectangle(96,224,128,256,1)
        if ((global.inv_holditemno=33)=0) {
            draw_sprite(spr,index,96+16,224+16)
           }
         if (mouse_x>=96 && mouse_x<=128 && mouse_y>=224 && mouse_y<=256&& global.inv_optionshow=0) {global.inv_select=33}
  //draw weapon slot 34
        var spr,index;
        spr=sItems
        index=global.inv_item[34,0]
        draw_rectangle(64,192,96,224,1)
        if ((global.inv_holditemno=34)=0) {
            draw_sprite(spr,index,64+16,192+16)
           }
         if (mouse_x>=64 && mouse_x<=96 && mouse_y>=192 && mouse_y<=224&& global.inv_optionshow=0) {global.inv_select=34}
     //draw offhand slot 35
        var spr,index;
        spr=sItems
        index=global.inv_item[35,0]
        draw_rectangle(128,192,160,224,1)
        if ((global.inv_holditemno=35)=0) {
            draw_sprite(spr,index,128+16,192+16)
           }
         if (mouse_x>=128 && mouse_x<=160 && mouse_y>=192 && mouse_y<=224&& global.inv_optionshow=0) {global.inv_select=35}
           //draw ring slot 36
        var spr,index;
        spr=sItems
        index=global.inv_item[36,0]
        draw_rectangle(128,224,160,256,1)
        if ((global.inv_holditemno=36)=0) {
            draw_sprite(spr,index,128+16,224+16)
           }
         if (mouse_x>=128 && mouse_x<=160 && mouse_y>=224 && mouse_y<=256&& global.inv_optionshow=0) {global.inv_select=36}
//draw amulet slot 37
        var spr,index;
        spr=sItems
        index=global.inv_item[37,0]
        draw_rectangle(128,160,160,192,1)
        if ((global.inv_holditemno=37)=0) {
            draw_sprite(spr,index,128+16,160+16)
           }
         if (mouse_x>=128 && mouse_x<=160 && mouse_y>=160 && mouse_y<=192&& global.inv_optionshow=0) {global.inv_select=37}                                                 
//Draw the held item
if (global.inv_holditem=true) {
    var spr,index;
    spr=sItems
    index=global.inv_item[global.inv_holditemno,0]
    //if (item_stackable(global.inv_item[global.inv_holditemno,0])=1) {spr=item_sprite(global.inv_item[global.inv_holditemno,0]); index=item_index(global.inv_item[global.inv_holditemno,1])}
    draw_sprite_ext(spr,index,mouse_x,mouse_y,1,1,0,c_white,0.5)
    if (item_stackable(global.inv_item[global.inv_holditemno,0])=1) {
        draw_set_alpha(0.5)
        draw_set_font(fnt002)
        draw_set_color(c_black)
        draw_text(mouse_x-15,mouse_y-15,value_str(global.inv_item[global.inv_holditemno,1]))
        draw_set_color(c_yellow)
        draw_text(mouse_x-16,mouse_y-16,value_str(global.inv_item[global.inv_holditemno,1]))
        draw_set_color(c_black)
        draw_set_alpha(1)
    }
}
