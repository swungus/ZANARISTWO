global.pt_dark= part_type_create();
var pt = global.pt_dark;
part_type_shape(pt,pt_shape_disk);
part_type_size(pt, .03, .1, 0 ,0 );
part_type_color3(pt,c_black,c_black,c_black)
part_type_speed(pt,0.6,1,-0.03,0,);
part_type_direction(pt,0,360,0,0)

part_type_blend(pt,false);
part_type_life(pt,4,12);
part_type_alpha2(pt, 1, 1);
