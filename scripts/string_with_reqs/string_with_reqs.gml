/// @desc final string, modified to meet player level
/// @arg string
/// @arg level_reqs
/// @arg player_lvl

var str_ar = [];
var lvl_reqs = [];

str_ar = argument0;
var len = array_length_1d(str_ar);
//show_message(len)
lvl_reqs = argument1;
//show_message(lvl_reqs);
var player_lvl = argument2;

//show_message(lvl_reqs)

//show_debug_message("Been here!");

// random machine
var rand = randomize();

for (var i = 0; i < len; ++i)
{
	if (lvl_reqs[i] > player_lvl)
	{
		var len_str = string_length(str_ar[i]);
		for (var j = 1; j <= len_str; ++j)
		{
			//show_debug_message(str_ar[i]);
			str_ar[i] = string_set_byte_at(str_ar[i], j, (string_ord_at(str_ar[i], j) + rand) % 255);
			rand = randomise();
			//show_debug_message(str_ar[i]);
		}	
	}
}

// return a proper string
var new_str = "";
for (var i = 0; i < len; ++i)
{
	new_str += str_ar[i] + " ";	
	show_debug_message(str_ar[i]);
}

show_debug_message(new_str);

return new_str;