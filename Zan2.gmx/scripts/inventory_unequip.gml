//Call:     inventory_unequip(no)
//Info:     This will uneqip item slot, removing the item from the slot and adding into inventory
//       
//Event:    Any
//Returns:  ---

var no ,temp1;
no=argument0


if (no=0) {exit;}
temp1=global.inv_item[no,0]
global.inv_item[no,0]=0
inventory_add(temp1,1)
