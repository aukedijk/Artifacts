///@arg event
///@arg listener_id

with (event_manager)
{
	var ev = argument[0];
	var objID = argument[1];
	
	// get listeners
	if (ds_map_exists(eventMap, ev))
	{	
		var listenerList = eventMap[? ev];
		var len = ds_list_size(listenerList);
		
		var i = 0; repeat (len)
		{
			var listenerInfo = listenerList[| i];
			if (listenerInfo[0] == objID)
			{
				// check we are only listener
				if (len == 1)
				{
					ds_list_destroy(listenerList);	
					ds_map_delete(eventMap, ev);
									
				}
				else
				{
					ds_list_delete(listenerList, i); // only delete single entry otherwise	
				}
				break;
				
			}
			
		}
		
	}
	
}