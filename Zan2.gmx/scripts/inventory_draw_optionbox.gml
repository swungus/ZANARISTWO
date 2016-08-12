//Call:     inventory_draw_optionbox(x,y,spr,alpha,backgroundcol)
//Info:     Draws the optionbox of an item, that will show the options of
//          the selected item. x and y is the position on the screen
//          to draw the box. spr is the sprite you want the info box to have,
//          you can write -1 if you don't want a sprite (like I have done).
//          Alpha is the alpha of the option box and backgroundcol is the
//          background color of the option box (only if you don't use a sprite).
//Event:    Draw
//Returns:  ---

var xx,yy,spr,alpha,bgcol,optionstr,options,optionwidth;
xx=argument0
yy=argument1
spr=argument2
alpha=argument3
bgcol=argument4
options=0
draw_set_font(fnt003)
optionwidth=string_width(item_name(global.inv_optionitemno))

//Set temporary variables
var a;
for (a=1 a<=10 a+=1) {
    if (item_options(global.inv_optionitemno,a)="" or a=10) {
        options=a-1;
        a=11
    } else {
        optionstr[a]=item_options(global.inv_optionitemno,a)
        if (string_width(optionstr[a]+" "+item_name(global.inv_optionitemno))>optionwidth) {optionwidth=string_width(optionstr[a]+" "+item_name(global.inv_optionitemno))}
    }
}
draw_set_alpha(alpha)

//Draw sprite or box
if (sprite_exists(spr)) {
    draw_sprite_stretched(spr,-1,xx,yy,(xx+optionwidth+12)-xx,(yy+((options+1)*12)+10)-yy)
} else {
    draw_set_color(bgcol)
    draw_rectangle(xx,yy,xx+optionwidth+12,yy+((options+1)*12)+10,0)

    draw_set_alpha(1)
    draw_set_color(c_black)
    draw_rectangle(xx,yy,xx+optionwidth+12,yy+((options+1)*12)+10,1)
    draw_rectangle(xx+2,yy+2,xx+optionwidth+10,yy+((options+1)*12)+8,1)
}

draw_set_alpha(1)
draw_set_color(c_black)
if (mouse_x<xx-4 || mouse_x>xx+optionwidth+16 || mouse_y<yy-4 || mouse_y>yy+((options+1)*12)+10) {global.inv_optionshow=0}
global.inv_optionselect=0

//Draw text
var no,str;
for (no=1 no<=options+1 no+=1) {
    if (no=options+1) {str="Cancel"} else {str=optionstr[no]}
    if (mouse_x>=xx+2 && mouse_x<=xx+optionwidth+10 && mouse_y>=yy+6+(12*(no-1)) && mouse_y<=yy+6+(12*(no-1))+10) {global.inv_optionselect=no}
    draw_set_color(c_black)
    draw_text(xx+6,yy+6+(12*(no-1)),str)
    if (global.inv_optionselect=no) {draw_set_color(c_red)} else {draw_set_color(c_white)}
    draw_text(xx+5,yy+5+(12*(no-1)),str)
    if (no<options+1) {
        draw_set_color(c_black)
        draw_text(xx+6+string_width(str+" "),yy+6+(12*(no-1)),item_name(global.inv_optionitemno))
        if (global.inv_optionselect=no) {draw_set_color(c_red)} else {draw_set_color(c_yellow)}
        draw_text(xx+5+string_width(str+" "),yy+5+(12*(no-1)),item_name(global.inv_optionitemno))
    }
}
//Check if the user press an option
if (mouse_check_button_pressed(mb_left)) {
    if (global.inv_optionselect=0 || global.inv_optionselect=options+1) {global.inv_optionshow=0} else {item_options_code(global.inv_optionitemno,global.inv_optionselect); global.inv_optionshow=0}
    mouse_clear(mb_left)
}
