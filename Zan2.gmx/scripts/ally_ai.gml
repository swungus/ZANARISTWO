///shooter_ai(enemyid,bulletid,shootspeed,maxspeed,maxspeedrun,leader,distancetofollowat)

path_update+=1;

if path_update>=path_update_speed
    {path_update=0;
    walking_path=0;
    }

//follow player, neutral mode
if mode=0
{

if (point_distance(x,y,obj_player.x,obj_player.y)>70 and point_distance(x,y,obj_player.x,obj_player.y)<140)
 and !collision_line(x,y,obj_player.x,obj_player.y,obj_wall,1,1)
vp_tds_ai_grid_walk(obj_player.x,obj_player.y,5,0)
image_angle=direction


if instance_exists(obj_enemy_parent) 
{
    i=0
    repeat(instance_number(obj_enemy_parent))
    {
    targetscan=instance_nth_nearest(x,y,obj_enemy_parent,i)
        if (collision_line(obj_player.x,obj_player.y,targetscan.x,targetscan.y,obj_solid_parent,0,0)=noone
        or collision_line(x,y,targetscan.x,targetscan.y,obj_solid_parent,0,0)=noone)
         and point_distance(x,y,targetscan.x,targetscan.y)<220  and targetscan.alerted=1
            {
            //for the closest enemy to the player !not! behind a wall,
            // if the player can see it
            //and it is close, acquire target  and enter combat mode
            target=targetscan
            mode=2
            
            }
            else {i+=1  target=noone}
    }


}


}
nearest_bullet= instance_nearest(x,y,obj_enemyspell_parent)


if distance_to_object(nearest_bullet) < 8{
if collision_line(x,y,nearest_bullet.x,nearest_bullet.y,obj_solid_parent,0,0)<=0
{
vp_tds_ai_grid_walk(nearest_bullet.x,nearest_bullet.y,-8,obj_solid_parent)
exit;
}   }



//if there is a target,
// go into line of sight of it  and shoot
//until target=noone



if mode=2
{
if instance_exists(target)
    {
    image_angle=point_direction(x,y,target.x,target.y)
            {
        if distance_to_object(obj_player)>100 or collision_line(x,y,obj_player.x,obj_player.y,obj_solid_parent,1,1)
            vp_tds_ai_grid_walk(obj_player.x,obj_player.y,4,0)
        else if distance_to_object(target)>50 or collision_line(x,y,target.x,target.y,obj_solid_parent,1,1)
        vp_tds_ai_grid_walk(target.x,target.y,4,0)
        if can_shoot=1 and !collision_line(x,y,target.x,target.y,obj_solid_parent,1,1)
            {
            bullet=instance_create(x,y,obj_sedridor_spell)
            bullet.direction=point_direction(x,y,target.x-10+random(10*2),target.y-10+random(10*2))
            can_shoot=0
            alarm[0]=random_range(10,50)} 
            }
    
    if point_distance(target.x,target.y,obj_player.x,obj_player.y)>=240
    {mode=0
    target=noone}
    
    
    }
else {target=noone mode=0}



}

