// talk to NPC
var npcIsNear = collision_circle(x, y, 30, npc0, false, false);
if (npcIsNear)
{
	instance_deactivate_object(press_Enter);
	
	event_invoke(event.dialogCall_0);
}


