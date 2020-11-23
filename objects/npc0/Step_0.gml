/// @description Indications to player
// You can write your code in this editor

var protagIsNear = collision_circle(x + 10, y + 10, 30, protag, false, false);

// handle approaching NPC
if (protagIsNear && !protagWasHere)
{
	// show UI automatically
	instance_deactivate_object(talk_to_NPC);
	instance_activate_object(press_Enter);
	protagWasHere = 1;
}

if (protagWasHere && !protagIsNear)
{
	instance_deactivate_object(press_Enter);
	protagWasHere = false; // check -> avoid deactivating objs over and over
}