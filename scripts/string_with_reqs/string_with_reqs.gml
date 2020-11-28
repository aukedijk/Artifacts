/// @desc final string, modified to meet player level
/// @arg string
/// @arg level_reqs
/// @arg player_lvl

// "string array" received from the string_to_array method, via the dialog_add_string method
var str_ar = [];
var lvl_reqs = [];

str_ar = argument0;
// record length of array, to terminate the for-loop below
var len = array_length_1d(str_ar);
lvl_reqs = argument1;
var player_lvl = argument2;


// random machine
var rand = randomize();

for (var i = 0; i < len; ++i)
{
	if (lvl_reqs[i] > player_lvl)
	{
		// keep the length of each string element from the array, to avoid running over the end
		var len_str = string_length(str_ar[i]);
		for (var j = 1; j <= len_str; ++j)
		{
			// 255 is max value for UTF-8 characters
			// string_ord_at finds the UTF-8 value of the character at a given index
			// string_set_byte_at changes the character value
			str_ar[i] = string_set_byte_at(str_ar[i], j, (string_ord_at(str_ar[i], j) + rand) % 255);
			rand = randomise();
		}	
	}
}

// return a proper string, with a space after each word
var new_str = "";
for (var i = 0; i < len; ++i)
{
	new_str += str_ar[i] + " ";	
}

return new_str;