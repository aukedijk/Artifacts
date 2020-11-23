///@arg event

with(event_manager)
{
	var ev = argument[0];
	
	// check there is eventt entry
	if (ds_map_exists(eventMap, ev))
	{
		// Get listeners 
		var listenerList = eventMap[? ev];
		
		var len = ds_list_size(listenerList);
		
		var listenerInfo, listener, script, args;
		var i = 0; repeat(len)
		{
			// Get vars for cur listener
			listenerInfo = listenerList[| i]; // | is accessor for lists
			listener = listenerInfo[0]; // ID
			script = listenerInfo[1]; // script
			
			var lenArgs = array_length_1d(listenerInfo) - 2;
			var unregister = false;
			
			if (lenArgs <= 0)
			{
				if (instance_exists(listener)) // check for destroyed instances
				{
					with(listener) unregister = script_execute(script);	// return "true" with event to toggle unregister var
				} else unregister = true;
			}
			else 
			{
				if (instance_exists(listener))
				{
					args = array_create(lenArgs, 0);	
					array_copy(args, 0, listenerInfo, 2, lenArgs);
					with (listener) unregister = script_execute_alt(script, args); // alt execute allows array as argument
				} else unregister = true;
			}
			
			if (unregister){
				event_unregister(ev, listener);
				
				i--; // avoid listener getting skipped by dynamic decrement
				
			}
						
			i++;
			
		}
		
	}
	
	
	
}