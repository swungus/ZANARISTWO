draw_set_halign(fa_center);
draw_path(mypath,x,y,true)

switch (state)
{
case 0: draw_text_color(x,y-64,"No Path Move",c_red,c_red,c_red,c_red,0.6); break;
case 1: draw_text_color(x,y-64,"Patrolling",c_green,c_green,c_green,c_green,0.6); break;
case 2: draw_text_color(x,y-64,"Alerted",c_yellow,c_yellow,c_yellow,c_yellow,0.6); break;
case 3: draw_text_color(x,y-64,"Spotted",c_red,c_yellow,c_red,c_yellow,0.6); break;
case 4: draw_text_color(x,y-64,"Following",c_red,c_red,c_red,c_red,0.6); break;
case 5: draw_text_color(x,y-64,"Guarding",c_green,c_green,c_yellow,c_yellow,0.6); break;
}

draw_text_color(x-32,y+32,xx,c_red,c_yellow,c_red,c_yellow,1);
draw_text_color(x+32,y+32,yy,c_red,c_yellow,c_red,c_yellow,1);
if p_num!=-1 draw_text_color(x-32,y-32,p_num,c_red,c_yellow,c_red,c_yellow,1);
draw_text_color(x+32,y-32,a_timer,c_red,c_yellow,c_red,c_yellow,1);

if len!=0
{
draw_circle_color(xx,yy,sprite_get_width(mask_index)/2,c_red,c_red,true);
}
