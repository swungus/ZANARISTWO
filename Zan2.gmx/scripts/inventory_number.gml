//Call:     inventory_number(itemID)
//Info:     Returns the number of items with number itemID.
//Event:    Any
//Returns:  The number of items with number itemID. (0 if there is none)

var itemno,number;
itemno=argument0
number=0

if (item_stackable(itemno)=1) {
    var invno,a;
    invno=0
    for (a=1 a<=28 a+=1) {
        if (global.inv_item[a,0]=itemno) {invno=a; a=29}
    }
    if (invno=0) {return (0); exit} else {number=global.inv_item[invno,1]}
} else {
    var a,no;
    no=0
    for (a=1 a<=28 a+=1) {
        if (global.inv_item[a,0]=itemno) {no+=1}
    }
    number=no
}
return (number)
