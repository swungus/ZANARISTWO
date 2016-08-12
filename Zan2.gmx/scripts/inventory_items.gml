//Call:     inventory_items()
//Info:     Returns the number of items in the inventory.
//Event:    Any
//Returns:  The number of items in the inventory.

var a,no;
no=0
for (a=1 a<=28 a+=1) {
    if (global.inv_item[a,0]>0) {no+=1}
}
return (no)
