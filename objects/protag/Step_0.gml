/// @description Properly render game elements as before or behind player

var list = ds_list_create();
var num_obj_surroundings = collision_circle_list(x, y, 35, all, false, true, list, false);

// get screen vertical dimension (in pixels, then in y) to be able to calculate height of in game sprites
var camera_pixels_y = 720;
var room_total_y = 768;

for (var i = 0; i < num_obj_surroundings; ++i)
{
	if (layer_get_name(ds_list_find_value(list, i).layer) == "Instances")
	{
		show_debug_message(ds_list_find_value(list, i).y + sprite_get_height(ds_list_find_value(list, i).sprite_index) / 8 / camera_pixels_y * room_total_y);
		
		// if higher on display, treat as behind player
		if (ds_list_find_value(list, i).y + sprite_get_height(ds_list_find_value(list, i).sprite_index) / 8 / camera_pixels_y * room_total_y <= y)
		{
			
			show_debug_message(y);
			layer_depth(ds_list_find_value(list, i).layer, layer_get_depth(layer) + 1);
		}
		else layer_depth(ds_list_find_value(list, i).layer, layer_get_depth(layer) - 1);
	}
}

// The dialog system does nothing if we don't tick it (= have it fetch new dialog)
dialog_tick(false); // false is to force dialog to play only when previous dialog is finished playing

// save mvspd value for diagonal mv support
var mvSpd = mvspd;

var buttonRight = keyboard_check(ord("D"));
var buttonLeft = keyboard_check(ord("A"));

var buttonUp = keyboard_check(ord("W"));
var buttonDown = keyboard_check(ord("S"));

// check for diagonal movement support
var horizInput = buttonRight || buttonLeft;
var vertInput = buttonUp || buttonDown;
var diagonMv = horizInput && vertInput;

var horiz_spd = 0;
var vert_spd = 0;

// handle horizontal movement
if (!inDialog)
{
	if (diagonMv)
	{
		mvSpd = mvspd / sqrt(2);
	}
	else
	{
		mvSpd = mvspd;
	}


	

	if (buttonRight)
	{
		horiz_spd = mvSpd;
	}
	else if (buttonLeft)
	{
		horiz_spd = -mvSpd;
	} 

	x += horiz_spd;

	if (buttonDown) // up is origin of y-axis
	{
		vert_spd = mvSpd;
	}
	else if (buttonUp)
	{
		vert_spd = -mvSpd;
	} 
}

y += vert_spd;

// force collision with buildings
if collision_line(x, y, xprevious, yprevious, all, true, true)
{
    x = xprevious;
    y = yprevious;
}


// animations
if (horiz_spd > 0)
{
	sprite_index = skelly_walk_right
}
else if(horiz_spd < 0)
{
	sprite_index = skelly_walk_left;
}
else
{
	if (facingLeft)
	{
		sprite_index = protag_mal_idle_left;
	}
	else sprite_index = protag_mal_idle;
}