//Call:     spawn_item(x,y,item,amount)
//Info:     This will create a oItemOnGround object with the
//          specified position and amount.
//Event:    Any
//Returns:  ---


var x1,y1,item1,amount1,obj;
x1=argument0
y1=argument1
item1=argument2
amount1=argument3

obj=instance_create(x1,y1,oItemOnGround)

obj.item=item1
obj.number=amount1
obj.withinroom=room
