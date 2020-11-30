/// @desc store all substrings in an array
/// @arg string
/// @return str_array

var str = argument0;
var len = string_length(str);

var str_array = [];

// index counter, to copy string bits into the appropriate array element
var i = 0;
// counter that records which place we are in the string
var place = 0;
// records where we previously stopped to copy a string, so we don't end up copying more than we need
var prevPlace = 0;


while (place <= len + 1)
{
	// copy string, including punctuation, whenever you hit a space, newline, or the end of the string
	// TODO(eloy): remove inclusion of spaces -> screws with the character randomizer
	if (string_char_at(str, place) == " " || string_char_at(str, place) == "\n" || place == len + 1)
	{
		str_array[i] = string_copy(str, prevPlace, place - prevPlace);
		prevPlace = place + 1;
		++i;
	}
	place++;
}

return(str_array);

