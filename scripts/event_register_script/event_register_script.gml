///@param event
///@arg listener_id
///@arg script
///@arg arg1...* // optional arguments


with(event_manager) {
	var ev = argument[0];
	var objID = argument[1];
	
	// check if event map exists or not, to avoid duplicates
	if (!ds_map_exists(eventMap, ev)) {
		// must add event to map
		var listenerList = ds_list_create();
		
		// add listener info to event map
		ds_map_add_list(eventMap, ev, listenerList); // adds to parent list, for later garbage collection (only need to destroy parent to destroy whole)
	} else {
		var listenerList = eventMap[? ev]; // map accessor	
	}
	
	// Add listener info
	var listenerInfo;
	
	// Add id to array 
	listenerInfo[0] = objID;
	
	// Add scripts and arguments
	var len = argument_count - 2; // - 2 for args already registered
	var i = 0; repeat(len) {
		listenerInfo[i + 1] = argument[i + 2];
		i++;
	}
	
	// Add listener info to the listener list
	ds_list_add(listenerList, listenerInfo);
	
}