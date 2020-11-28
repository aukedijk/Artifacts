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


