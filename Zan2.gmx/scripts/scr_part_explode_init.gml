global.pt_explode= part_type_create();
var pt = global.pt_explode;
part_type_shape(pt,pt_shape_square);
part_type_size(pt, .3, .4, 0 ,0 );
part_type_color3(pt,c_orange,c_yellow,c_dkgray)
part_type_speed(pt,1,2,0,0,);
part_type_direction(pt,0,360,3,0);
part_type_orientation(pt,0,360,3,0,0)
part_type_blend(pt,true);
part_type_life(pt,10,20);
part_type_alpha2(pt, 1, 1);
