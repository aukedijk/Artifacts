// talk to NPC
var npcIsNear = collision_circle(x, y, 35, npc0, false, false);
if (npcIsNear && !inDialog)
{
	// remove "Press Enter"sign
	instance_deactivate_object(press_Enter);
	
	// call event whenever close to npc0, for npc0 to listen and launch dialog
	event_invoke(event.dialogCall_0);
	
	// prevent loading dialog while already in dialog
	inDialog = true;
}


