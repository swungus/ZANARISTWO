//Call:     inventory_switch(no1,no2)
//Info:     This will switch item number no1 with item number
//          no2 in the inventory.
//Event:    Any
//Returns:  ---

var no1,no2,temp1,temp2;
no1=argument0
no2=argument1

if (no1=0 or no2=0) {exit;}
temp1=global.inv_item[no1,0]
temp2=global.inv_item[no1,1]
global.inv_item[no1,0]=global.inv_item[no2,0]
global.inv_item[no1,1]=global.inv_item[no2,1]
global.inv_item[no2,0]=temp1
global.inv_item[no2,1]=temp2
