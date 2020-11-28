///@arg event

with(event_manager)
{
	var ev = argument[0];
	
	// check there is an event entry in the data structure holding all events
	if (ds_map_exists(eventMap, ev))
	{
		// Get listeners 
		var listenerList = eventMap[? ev];
		
		var len = ds_list_size(listenerList);
		
		var listenerInfo, listener, script, args;
		var i = 0; repeat(len)
		{
			// Get variables for the current listener
			listenerInfo = listenerList[| i]; // | is accessor for lists (just a convention)
			listener = listenerInfo[0]; // ID of the listener
			script = listenerInfo[1]; // script the listener would want to play when event is called
			
			// -2 because we already handled the first two slots in the above
			var lenArgs = array_length_1d(listenerInfo) - 2;
			
			// unregister variable can be switched to true to signal this script that a listener wants to 
			// be unregistered from an event, once the action linked to that event has been player
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
					// alt execute allows array as argument
					with (listener) unregister = script_execute_alt(script, args);
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