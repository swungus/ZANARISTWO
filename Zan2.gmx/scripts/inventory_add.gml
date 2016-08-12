//Call:     inventory_add(itemID,quantity)
//Info:     Adds item(s) to the inventory. itemID is the ID
//          of the item to be added and quantity is the number
//          of that item you want to add.
//Event:    Any
//Returns:  Number of items that couldn't be added because
//          the inventory was full. For example, if you add
//          10 items and there's only 7 places left in the
//          inventory, it will return 3.

var itemno,number,newno;
newno=0
itemno=argument0
number=argument1

var a;
if (item_stackable(itemno)=1) {
    var a;
    for (a=1 a<=28 a+=1) {
        if (global.inv_item[a,0]=itemno) {newno=a; global.inv_item[a,1]+=number; a=29;}
    }
    if (newno=0) {
        var b,lastno;
        lastno=0
        for (b=1 b<=28 b+=1) {
            if (global.inv_item[b,0]=0) {lastno=b; b=29}
        }
        if (lastno=0) {
            return (1)
        } else {
            global.inv_item[lastno,0]=itemno
            global.inv_item[lastno,1]=number
        }
    }
} else {
    var lastno,n;
    lastno=0
    n=0
    repeat (number) {
        n+=1
        var a;
        for (a=1 a<=28 a+=1) {
            if (global.inv_item[a,0]=0) {lastno=a; a=29}
        }
        if (lastno=0) {
            return (number-n)
        } else {
            global.inv_item[lastno,0]=itemno
            global.inv_item[lastno,1]=1
        }
    }
}
return (0)
