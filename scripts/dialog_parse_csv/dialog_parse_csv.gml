/// @desc parse dialog csv
/// @arg key_name

var file_grid = global.dialog_csv;

var key = argument0;

var ww = ds_grid_width(file_grid);
var hh = ds_grid_height(file_grid);
var xx = 32;
var yy = 32;

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
	var str = string_replace_all(file_grid[# 4, cur_line], "\\", "\n");
	var portrait = file_grid[# 5, cur_line];
	
	if (portrait != "")
	{
		dialog_add_string(key, str, portrait);
	}
	else dialog_add_string(key, str);
	
	// do the branches, if any
	var cur_str = "";
	var i = cur_line + 1;
	
	//for (var i = cur_line + 1; cur_str == ""; i++)
	//{
		//show_debug_message(file_grid[# 2, i]);
		//show_debug_message(file_grid[# 3, i]);
	//	show_debug_message(i);
	//	show_debug_message(file_grid[# 1, i]);
		
		
	//}
	while (file_grid[# 2, i] != "")
	{
		//show_debug_message("Made it here!")
		
		dialog_add_branch(key, file_grid[# 2, i], file_grid[# 3, i], string_replace_all(file_grid[# 4, i], "\\", "\n"));
		
		//show_debug_message(i);
		//show_debug_message(file_grid[# 2, i]);
		
		++i;
	}
}
else
{
	show_message("Dialog not properly loaded. Abort!");	
}

//for (var i = 0; i < ww; i++;)
//{
//    for (var j = 0; j < hh; j++;)
//    {
//		draw_text(xx, yy, string(file_grid[# i, j]));
//		yy += 32;
//    }
//	yy = 32;
//	xx += 32;
//}