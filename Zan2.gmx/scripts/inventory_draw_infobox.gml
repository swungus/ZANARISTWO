//Call:     inventory_draw_infobox(x,y,spr,alpha,backgroundcol)
//Info:     Draws the infobox, that will show some information about
//          the selected item. x and y is the position on the screen
//          to draw the box. spr is the sprite you want the info box to have,
//          you can write -1 if you don't want a sprite (like I have done).
//          Alpha is the alpha of the info box and backgroundcol is the
//          background color of the info box (only if you don't use a sprite).
//Event:    Draw
//Returns:  ---

var xx,yy,spr,alpha,bgcol;
xx=argument0
yy=argument1
spr=argument2
alpha=argument3
bgcol=argument4

draw_set_alpha(alpha)

//Draw infobox
if (sprite_exists(spr)) {
    draw_sprite_stretched(spr,-1,xx,yy,(xx+138)-xx,(yy+66)-yy)
} else {
    draw_set_color(bgcol)
    draw_rectangle(xx,yy,xx+138,yy+66,0)

    draw_set_alpha(1)
    draw_set_color(c_black)
    draw_rectangle(xx,yy,xx+138,yy+66,1)
    draw_rectangle(xx+2,yy+2,xx+136,yy+64,1)
}
draw_set_alpha(1)
draw_set_color(c_black)

//Set temporary variables
var invno,itemno,name,number;
if (global.inv_holditem=1) {invno=global.inv_holditemno} else {invno=global.inv_select}
itemno=global.inv_item[invno,0]
number=global.inv_item[invno,1]
name=item_name(itemno)
info=item_info(itemno)

//Draw the item's name
draw_set_font(fnt001)
draw_set_color(c_black)
draw_text(xx+6,yy+6,name)
draw_set_color(c_red)
draw_text(xx+5,yy+5,name)

draw_set_font(fnt002)
//If the item is stackable, draw the number
if (item_stackable(itemno)=1) {
    draw_set_color(c_blue)
    draw_text(xx+5,yy+17,"x"+string(number))
}
//Draw the item info
draw_set_color(c_black)
draw_text(xx+6,yy+38,info)
draw_set_color(c_yellow)
draw_text(xx+5,yy+37,info)
