//Call:     drop_item(invno)
//Info:     This will create a oItemOnGround object on the
//          players position with the selected item's variables.
//Event:    Any
//Returns:  ---

var invno,obj;
invno=argument0

obj=instance_create(obj_player.x,obj_player.y,oItemOnGround)

obj.item=global.inv_item[invno,0]
obj.number=global.inv_item[invno,1]
obj.withinroom=global.room_level
global.inv_item[invno,0]=0
global.inv_item[invno,1]=0
