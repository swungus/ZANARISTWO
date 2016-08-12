//Call:     item_index(value)
//Info:     Returns the index on a stackable item depending
//          on the value. (if you have 1000 money, it is displayed
//          as a big money pile instead of a small)
//Event:    Any
//Returns:  The image index of a stackable item no depending on the value

var no,value,index;
value=argument0
index=0

if (value=1) {index=0}
if (value>=2) {index=1}
if (value>=5) {index=2}
if (value>=20) {index=3}
if (value>=200) {index=4}
if (value>=1000) {index=5}

return (index)
