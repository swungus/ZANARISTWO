//Call:     item_options_code(itemID,optionno)
//Info:     Sets what will happen when you click option optiono
//          in the selecte item.
//Event:    Any
//Returns:  ---

var no,no1;
no=argument0
no1=argument1

if (no=1) {
    if (no1=1) {drop_item(global.inv_select)}   //Drop
}
if (no=2) {
    if (no1=1) {show_message("Wear!")}          //Simple message
    if (no1=2) {drop_item(global.inv_select)}   //Drop
}
if (no=14) {
    if (no1=1) if global.inv_select<30 {inventory_switch(global.inv_select,31)} else {inventory_unequip(31)}     //equippo
    if (no1=2) {room_goto(global.room_level)
    lastselected=global.inv_select
    alarm[0]=1}   //Drop
    
}
if (no=15) {
    if (no1=1) if global.inv_select<30 {inventory_switch(global.inv_select,32)} else {inventory_unequip(32)}     //equippo
    if (no1=2) {room_goto(global.room_level)
    lastselected=global.inv_select
    alarm[0]=1}   //Drop
}

