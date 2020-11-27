/// @desc parse dialog csv
/// @arg key_name

var file_grid = global.dialog_csv;

var key = argument0;

var hh = ds_grid_height(file_grid);


// find correct line for argument
var cur_line = -1;
for(var j = 1; j < hh; ++j) // real text only starts at row 2
{
	if (file_grid[# 1, j] == key)	cur_line = j;
	//show_debug_message(cur_line);
	//show_debug_message(file_grid[# 1, j])
}

//show_debug_message(file_grid[# 0, 1]);

// check it found line
if (cur_line != -1)
{
	//show_debug_message(DO_NOTHING);
	//show_debug_message(npc0_potion_requested);
	
	//show_debug_message(file_grid[# 5, cur_line]);
	var str_ar = string_to_array(string_hash_to_newline(file_grid[# 4, cur_line]));
	var portrait = file_grid[# 5, cur_line];
	var lvls_ar = array_to_array(file_grid[# 6, cur_line]);
	//show_message(lvls_array);
	
	dialog_add_string(key, str_ar, lvls_ar, portrait);
	
	// do the branches, if any
	var i = cur_line + 1;
	while (file_grid[# 2, i] != "")
	{
		//show_debug_message("Made it here!")
		
		dialog_add_branch(key, file_grid[# 2, i], file_grid[# 3, i], string_hash_to_newline(file_grid[# 4, i]));
		
		//show_debug_message(i);
		//show_debug_message(file_grid[# 2, i]);
		
		++i;
	}
}
else
{
	show_message("Dialog not properly loaded. Abort!");	
}