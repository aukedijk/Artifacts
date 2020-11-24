/// @desc Add a string to a dialog
/// @arg dialog The dialog to add the string to
/// @arg string The string to add
/// @arg portrait The portrait to be displayed

var __map = global.dialog_map_strings;
ds_map_replace(__map, argument[0], argument[1]);

if (argument_count > 2) {
		
	dialog_add_portrait(argument[0], argument[2]);
	
	//if (argument_count > 3) {
	//	dialog_add_orientation(argument[0], argument[3]);
	//}
}

