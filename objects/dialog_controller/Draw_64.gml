/// @description Draw dialog box
// You can write your code in this editor

if (!fetch){
	
	draw_set_font(fnt_dialog);

	var xoffset = 0;
	if(dialog_avatar != "") {
		if (dialog_left_facing)
		{
			xoffset = -32;
		} else 
			xoffset = 32;
	
	}
	
	var x_pos = camera_get_view_width(view_camera[0]) / 2 + 155 - xoffset;
	var y_pos = camera_get_view_height(view_camera[0]) + 180;
	
	draw_set_halign(fa_left); // font align left
	draw_sprite(spr_dialog_box, 0, x_pos, y_pos);
	draw_text_ext(x_pos + 10, y_pos + 6, string_hash_to_newline(dialog_output), 16, 175);
	
	//show_debug_message("Dialog box drawn!");
	
	//show_debug_message(dialog_avatar != "" ? "avatar exists" : "no avatar");
	
	// draw avatar box if needed
	if ( dialog_avatar != "")
	{
		if (dialog_left_facing)
		{
			draw_sprite(spr_portrait_box, 1, x_pos - 61, y_pos);
			draw_sprite(dialog_avatar, 0, x_pos - 56, y_pos + 4);
		}
		else 
		{
			draw_sprite(spr_portrait_box, 0, x_pos + 188, y_pos );
			draw_sprite_ext(dialog_avatar, 0,  x_pos + 248, y_pos + 4, -1, 1, 0, c_white, 1 );
		}
	}
	
}