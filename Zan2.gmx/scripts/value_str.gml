//Call:     value_str(value)
//Info:     Returns with the string of value.
//          (13,349,123 is displayed as 13M for example)
//Event:    Any
//Returns:  The str of value.

var val,str;
val=argument0
str=string(val)

if (val>=100000) {str=string_copy(string(val),1,3)+"K"}
if (val>=1000000) {str=string_copy(string(val),1,4)+"K"}
if (val>=10000000) {str=string_copy(string(val),1,2)+"M"}
if (val>=100000000) {str=string_copy(string(val),1,3)+"M"}
if (val>=1000000000) {str=string_copy(string(val),1,4)+"M"}

return (str)
