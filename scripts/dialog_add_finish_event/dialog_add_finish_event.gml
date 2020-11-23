/// @desc Add a script to execute when this dialog is done
/// @func dialog_add_finish_event
/// @arg dialog The dialog to add the event to
/// @arg script The script to add

var __map = global.dialog_finish_events;
var __list = ds_map_find_value(__map, argument0);

if(__list == undefined)
{
	__list = ds_list_create();
	ds_map_set(__map, argument0, __list);
}

ds_list_add(__list, argument1);