/// @desc Add a string to a dialog
/// @arg dialog The dialog to add the string to
/// @arg str_array The string to add
/// @arg modded_str_ar String modified for language level simulation
/// @arg portrait The portrait to be displayed

var __map = global.dialog_map_strings;

var dialog_id = argument0;
var str_array = argument1;
//var portrait = argument[2];
var lvls_ar = argument2;

//show_message(lang_lvl);

ds_map_replace(__map, dialog_id, str_array);

dialog_add_lvls(dialog_id, lvls_ar);

if (argument_count > 3) {
		
	dialog_add_portrait(dialog_id, argument3);
}

