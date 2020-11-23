/// @description Create dialog boxes
// You can write your code in this editor

instance_deactivate_object(press_Enter);


// register for dialog event
init_potions_dialog();
event_register_script(event.dialogCall_0, id, npc0_dialog_begin)