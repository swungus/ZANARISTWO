///funcPathOptimized(id,gridSize,obstacle)
var id_=argument[0];
var gridSize=argument[1]*.5;
var obstacle=argument[2];
var i;

for(i=0;i<path_get_number(id_)-2;i++)
{
    var px1=path_get_point_x(id_,i);
    var py1=path_get_point_y(id_,i);
    var px2=path_get_point_x(id_,i+2);
    var py2=path_get_point_y(id_,i+2);
    
    if(!collision_line(
        px1-gridSize,py1-gridSize,
        px2-gridSize,py2-gridSize,
        obstacle,false,false) &&
    
    !collision_line(
        px1+gridSize-1,py1-gridSize,
        px2+gridSize-1,py2-gridSize,
        obstacle,false,false) &&
    
    !collision_line(
        px1+gridSize-1,py1+gridSize-1,
        px2+gridSize-1,py2+gridSize-1,
        obstacle,false,false) &&
    
    !collision_line(
        px1-gridSize,py1+gridSize-1,
        px2-gridSize,py2+gridSize-1,
        obstacle,false,false))
    {
        path_delete_point(id_,i+1); i--;
    }
}
