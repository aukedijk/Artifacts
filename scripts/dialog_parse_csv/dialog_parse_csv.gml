/// @desc parse dialog csv
/// @arg key_name

var file_grid = global.dialog_csv;

var key = argument0;

var hh = ds_grid_height(file_grid);


// find correct line for argument
var cur_line = -1;
for(var j = 1; j < hh; ++j) // real text only starts at second row (with index 1)
{
	// increment the current line until you find the key (ID)
	if (file_grid[# 1, j] == key)	cur_line = j;
}

// check it found line
if (cur_line != -1)
{
	var str_ar = string_to_array(string_hash_to_newline(file_grid[# 4, cur_line]));
	var portrait = file_grid[# 5, cur_line];
	
	/*
	 *	array_to_array is called that way because we're technically writing an array in the Goggle sheets,
	 *	but GM doesn't recognize it, so it has to be transformed into a GM-approved array
	 */
	var lvls_ar = array_to_array(file_grid[# 6, cur_line]); 
	
	dialog_add_string(key, str_ar, lvls_ar, portrait);
	
	// parse the branches, if they exist
	var i = cur_line + 1;
	
	// only do the below for the lines starting with branch ID numbers
	while (file_grid[# 2, i] != "")
	{
		var branch = file_grid[# 2, i];
		var script = file_grid[# 3, i];
		// use string_hash_to_newline method to transform # into a newline
		var text = string_hash_to_newline(file_grid[# 4, i]);
		dialog_add_branch(key, branch, script, text);
		
		++i;
	}
}
else // has not found requested dialog, abort immediately
{
	show_message("Dialog not properly loaded. Abort!");	
}