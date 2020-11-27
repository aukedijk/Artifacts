/// @desc store all substrings in an array
/// @arg string
/// @return str_array

var str = argument0;
var len = string_length(str);

var str_array = [];

var i = 0;
var place = 0;
var prevPlace = 0;


while (place <= len + 1)
{
	// copy string, including punctuation
	if (string_char_at(str, place) == " " || string_char_at(str, place) == "\n" || place == len + 1)
	{
		str_array[i] = string_copy(str, prevPlace, place - prevPlace);
		prevPlace = place;
		++i;
	}
	place++;
}
//show_message(str_array);
//show_message(dialog_get_lvl(101));
//show_message(string_with_reqs(str_array, dialog_get_lvl(101), 4));
return(str_array);

