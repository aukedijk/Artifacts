///@arg event
///@arg listener_id

// "with" goes and grabs a reference to all the variables local to the event manager => the events list
with (event_manager)
{
	var ev = argument[0];
	var objID = argument[1];
	
	// get listeners list for this event
	if (ds_map_exists(eventMap, ev))
	{	
		var listenerList = eventMap[? ev];
		var len = ds_list_size(listenerList);
		
		var i = 0; repeat (len)
		{
			var listenerInfo = listenerList[| i];
			if (listenerInfo[0] == objID)
			{
				// if we are the only listener remaining, destroy the whole listeners list for this event
				// VERY IMPORTANT to avoid maps lying around in memory (otherwise, we 've got a memory leak)
				if (len == 1)
				{
					ds_list_destroy(listenerList);	
					ds_map_delete(eventMap, ev);
									
				}
				else
				{
					ds_list_delete(listenerList, i); // otherwise, only delete single listener from list
				}
				break;
				
			}
			
		}
		
	}
	
}