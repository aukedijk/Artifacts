/// @desc Prepare dialog

_str_ar = dialog_get_string(key);
_lvls_ar = dialog_get_lvls(key);

// send lvls average for xp system support
//compute_lvls_average(_lvls_ar);

// get new string by converting string array, and randomizing certain words based on player level
_new_string = string_with_reqs(_str_ar, _lvls_ar, protag.playerLvl);

_branches = dialog_get_available_branches(key);
options = ds_list_size(_branches);
_branching = options > 0;
calling_instance = arg[0];

// If the instance no longer exists then it is executed from the scope of obj_dialog
if(calling_instance == undefined || !instance_exists(calling_instance)) {
	calling_instance = id;
}

if(arg_count > 0)
{
	// Add arguments to string
	var argc = 0;
	while(argc < arg_count) {
		var argstr = "{" + string(argc) + "}";
		if(string_count(argstr, _string) > 0) {
			_new_string = string_replace_all(_new_string, argstr, arg[argc + 1]);
		}
		++argc;
	}
}

// Expand macro variables, e.g. ${item_name} to value of the "item_name" variable
var st = _new_string;
with(calling_instance) {
	// Expand macro
	st = dialog_expand_macros(st);
}
_new_string = st;

// Wrap the string to display
var fnt = draw_get_font();

// Set the font to use for string_width
draw_set_font(fnt_dialog);

// -128 for the 2x 64 corners in the 9-slice sprite
_strings = string_wrap(_new_string, dialog_get_width() - 128);

//
// Calculate height of dialog box
//
dialogHeight = 0;
for(var i = 0; i < array_length_1d(_strings); ++i) {
	if(_strings[i] == "") dialogHeight += string_height("l");
	else dialogHeight += string_height(_strings[i]);
}
dialogHeight = max(dialogHeight + 64, 128);

//
// Calculate height of branches box
//
branchesHeight = 0;
for(var i = 0; i < options; ++i) {
	branchesHeight += string_height(_branches[| i]);
}
branchesHeight = max(branchesHeight + 64, 128);

// Reset font
draw_set_font(fnt);

// Start the dialog
if(DIALOG_SYSTEM_START_DELAY <= 0) event_perform(ev_alarm, 0);
else alarm_set(0, DIALOG_SYSTEM_START_DELAY);