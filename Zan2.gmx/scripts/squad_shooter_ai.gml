////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
/*
Put this script in the Step event

shooter_ai(enemyid,coverid,enemybulletid,bulletid,speedatk,maxspeeddef,shootspd,registered)


enemyid:       The enemy object*
coverid:       The object considered as cover*
enemybulletid: The enemy bullet object*
bulletid:      The bullet object that this object will fire**
speedatk:      The speed to seek out the enemy
maxspeeddef:   The maximum speed to run to cover
shootspd:      How often this object shoots***
registered:    Are you registered? True or False (use or don't use image_angle) 

*If you have different objects (eg. several different enemy objects for this object to fight),
use a parent. The example in the brackets, make a new object called "enemy_parent" and set
it as the parent for every enemy object. Then in the script put "shooter_ai(enemy_parent,...etc.)"

**If you have different objects for different bullets to fire, use a variable.
For example a variable called bullet_type and set this variable to equal whatever bullet object you
like. Then put in the script, "shooter_ai(*,*,*,bullet_type...etc.)

***Set this to random(...) to make the regularity of shooting more realistic.


                IMPORTANT!!!
/////////////////////////////////////////////////
In the Create event put:
////////////////////
mode=0
can_shoot=0
shootx=0
shooty=0
sx=0
sy=0
/////////////////
to avoid errors
Alternatively you could kill a puppy :P
(Treat unitialized variables as 0)
////////////////////////////////////////////////
*/
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////by Chhaaiinnssaaww! Get Some!////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
var nearest_enemy, nearest_cover, nearest_bullet, safe_x, safe_y, sped, dir, bb;

if instance_exists(argument0) && instance_exists(argument1) {
nearest_enemy=instance_nearest(x,y,argument0)
nearest_cover=instance_nearest(x,y,argument1)
nearest_bullet=instance_nearest(x,y,argument2)
dir=point_direction(x,y,nearest_cover.x,nearest_cover.y)
safe_x=nearest_cover.x+lengthdir_x(distance_to_object(nearest_cover)+64,dir)
safe_y=nearest_cover.y+lengthdir_y(distance_to_object(nearest_cover)+64,dir)
sped=argument5
can_shoot-=1
if speed>argument5 speed=argument5
if point_distance(x,y,argument8.x,argument8.y)<argument9{
if collision_line(x,y,nearest_enemy.x,nearest_enemy.y,argument1,1,1)
mode=1

if !collision_line(x,y,nearest_enemy.x,nearest_enemy.y,argument1,1,1)
                                                                          //feel free to play with the above number (10)
mode=0}
else
mode=2



if mode=2{
mp_potential_step(argument8.x-argument9+random(argument9*2),argument8.y-argument9+random(argument9*2),argument4,0)
if collision_line(x,y,nearest_enemy.x,nearest_enemy.y,argument1,1,1){
if argument7=1
image_angle=point_direction(x,y,argument8.x,argument8.y)}
else{
shootx=nearest_enemy.x
shooty=nearest_enemy.y
if argument7=1
image_angle=point_direction(x,y,nearest_enemy.x,nearest_enemy.y)
}   
if distance_to_object(nearest_bullet) < 150{
if !collision_line(x,y,nearest_bullet.x,nearest_bullet.y,argument1,1,1)
mp_potential_step(nearest_bullet.x+45,nearest_bullet.y+45,-8,0)}
if can_shoot<1 && (distance_to_object(nearest_enemy)<200 or !collision_line(x,y,nearest_enemy.x,nearest_enemy.y,argument1,1,1))
{
bb=instance_create(x,y,argument3)
bb.direction=point_direction(x,y,(shootx-((speed+4)*10)+random((((speed+4*2))*10))),shooty)
if !collision_line(x,y,nearest_enemy.x,nearest_enemy.y,argument1,1,1)
can_shoot=argument6
else
can_shoot=(argument6*2)}}

if mode=1{
if argument7=1
image_angle=point_direction(x,y,nearest_enemy.x,nearest_enemy.y)
if collision_line(x,y,nearest_enemy.x,nearest_enemy.y,nearest_cover,1,1){
if point_distance(nearest_enemy.x,nearest_enemy.y,shootx,shooty)>90/*play with this value*/ or (x!=sx && y!=sy)
mp_potential_step(nearest_enemy.x,nearest_enemy.y,argument4,0)
}
else{
shootx=nearest_enemy.x
shooty=nearest_enemy.y
sx=x
sy=y
speed=0
///////////////////////////////
}

if distance_to_object(nearest_bullet) < 150{
if !collision_line(x,y,nearest_bullet.x,nearest_bullet.y,argument1,1,1)
mp_potential_step(nearest_bullet.x+45,nearest_bullet.y+45,-8,0)}
if can_shoot<1
{if x=sx && y=sy{
bb=instance_create(x,y,argument3)
bb.direction=point_direction(x,y,(shootx-((speed+4)*10)+random((((speed+4*2))*10))),shooty)}
if !collision_line(x,y,nearest_enemy.x,nearest_enemy.y,argument1,1,1)
can_shoot=argument6
else
can_shoot=(argument6*3)}}

if mode=0{ 
if !collision_line(x,y,nearest_enemy.x,nearest_enemy.y,argument1,1,1)
mp_potential_step(safe_x,safe_y,sped,0)
else
speed=0
if distance_to_object(nearest_enemy)<100{
if can_shoot<1
{if !collision_line(x,y,nearest_enemy.x,nearest_enemy.y,argument1,1,1){{
bb=instance_create(x,y,argument3)
bb.direction=point_direction(x,y,(nearest_enemy.x-(speed*20)+random((speed*40))),nearest_enemy.y)}
if argument7=1
image_angle=point_direction(x,y,nearest_enemy.x,nearest_enemy.y)}
can_shoot=argument6}
}
else{if argument7=1
image_angle=point_direction(x,y,safe_x,safe_y)
}}
} 



