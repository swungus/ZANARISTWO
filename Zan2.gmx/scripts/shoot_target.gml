//////////////////////////////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////S H O O T  T H E  T A R G E T/////////////////////////////////////////
//////////////////////////////////////////////////////////////////////////////////////////////////////////
/*

This script makes the object which it is applied to, shoot at its enemy if it has a clear line of sight

Argument0: the object's bullet that it will fire
Argument1: the object's enemy
Argument2: an object that is considered to be cover

*/
//////////////////////////////////////////////////////////////////////////////////////////////////////////

if instance_exists(argument1){//because if an enemy doesn't exist, then it causes an error

//////////////////////////////////////////////////////////////////////////////////////////////////////////
var nearest_enemy;//initialize variables so as not to cause errors

nearest_enemy=instance_nearest(x,y,argument1)//"nearest_enemy" is the nearest instance of the object's enemy

if !collision_line(x,y,nearest_enemy.x,nearest_enemy.y,argument2,0,1)//if there is line of sight between this object
                                                    //the enemy
instance_create(x,y,argument0)//create a bullet to shoot it with!
}
//////////////////////////////////////////////////////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////////////////////////////////////////////////////
////////////////////////////////by ChHaAiInNsSaAwW! Get some!/////////////////////////////////////////////
//////////////////////////////////////////////////////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////////////////////////////////////////////////////

