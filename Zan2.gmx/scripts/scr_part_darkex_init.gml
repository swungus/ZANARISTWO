global.pt_darkex= part_type_create();
var pt = global.pt_darkex;
part_type_shape(pt,pt_shape_ring);
part_type_size(pt, .05, .3, 0 ,0 );
part_type_color3(pt,c_black,c_black,c_black)
part_type_speed(pt,0.1,1,0,0,);
part_type_direction(pt,0,360,0,0)

part_type_blend(pt,false);
part_type_life(pt,10,30);
part_type_alpha2(pt, 1, 1);
