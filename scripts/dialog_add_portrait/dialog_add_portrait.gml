/// @descr add portrait for interlocutor
/// @arg dialog key
/// @arg portrait

var __map = global.dialog_map_portraits;
ds_map_replace(__map, argument[0], argument[1]);