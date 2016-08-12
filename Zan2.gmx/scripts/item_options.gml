//Call:     item_options(itemID,optionno)
//Info:     Returns with item itemID's option string.
//Event:    Any
//Returns:  Option number optionno's string.

var no,no1,option;
no=argument0
no1=argument1
option=""

if (no=1) {
    if (no1=1) {option="Drop"}
}
if (no=2) {
    if (no1=1) {option="Wear"}
    if (no1=2) {option="Drop"}
}
if (no=3) {
    if (no1=1) {option="Wear"}
    if (no1=2) {option="Drop"}
}
if (no=4) {
    if (no1=1) {option="Drop"}
}
if (no=5) {
    if (no1=1) {option="Drop"}
}
if (no=6) {
    if (no1=1) {option="Eat"}
    if (no1=2) {option="Drop"}
}
if (no=7) {
    if (no1=1) {option="Wear"}
    if (no1=2) {option="Drop"}
}
if (no=8) {
    if (no1=1) {option="Eat"}
    if (no1=2) {option="Smell at"}
    if (no1=3) {option="Drop"}
}
if (no=9) {
    if (no1=1) {option="Read"}
    if (no1=2) {option="Smell at"}
    if (no1=3) {option="Sing to"}
    if (no1=4) {option="Throw away"}
    if (no1=5) {option="Attack"}
    if (no1=6) {option="Look at"}
    if (no1=7) {option="Listen to"}
    if (no1=8) {option="Eat"}
    if (no1=9) {option="Drop"}
}
if (no=10) {
    if (no1=1) {option="Drop"}
}
if (no=12) {
    if (no1=1) {option="Drop"}
}
if (no=13) {
  if (no1=2) {option="Drop"}
    if (no1=1) {option="Wield"}
}
if (no=14) {
  if (no1=2) {option="Drop"}
    if (no1=1)
        {
        if global.inv_select<30 {option="Equip"} else  {option='Unequip'}
         }
}
if (no=15) {
  if (no1=2) {option="Drop"}
    if (no1=1)
        {
        if global.inv_select<30 {option="Equip"} else  {option='Unequip'}
         }
}
return (option)
