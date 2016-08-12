//Call:     inventory_delete(itemID,quantity)
//Info:     Delete the first item in the inventory with number itemID.
//          quantity is the number of that item you want to delete.
//Event:    Any
//Returns:  Whether the item you want to delete existed
//          in the inventory. (If you want to delete 10 items for example,
//          but you only have 3 in the inventory, none will be deleted and
//          it will return 0)

var itemno,number;
itemno=argument0
number=argument1

if (inventory_number(itemno)<number) {return (0)}

if (item_stackable(itemno)=1) {
    var a,deleteno;
    for (a=1 a<=28 a+=1) {
        if (global.inv_item[a,0]=itemno) {deleteno=a a=29}
    }
    global.inv_item[deleteno,1]-=number
    if (global.inv_item[deleteno,1]<=0) {
        global.inv_item[deleteno,0]=0
        global.inv_item[deleteno,1]=0
    }
} else {
    var a,deleted;
    deleted=0
    for (a=1 a<=28 a+=1) {
        if (global.inv_item[a,0]=itemno) {
            global.inv_item[a,0]=0
            global.inv_item[a,1]=0
            deleted+=1
        }
        if (deleted=number) {a=29}
    }
}
return (1)
